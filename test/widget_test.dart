// Data-integrity tests for the project showcase.
//
// These replace the default "counter" boilerplate (which never matched this
// app). They assert invariants on the hardcoded project data that, if broken,
// would crash the app at startup or corrupt the timeline.

import 'package:devsite_web/application/model/project.dart';
import 'package:devsite_web/application/model/tags.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('project ids are unique', () {
    final ids = projects.map((p) => p.id).toList();
    expect(ids.toSet().length, ids.length,
        reason: 'Duplicate project ids found: $ids');
  });

  test('every project tag resolves to a defined tag', () {
    // getTag now falls back gracefully, but the tag name should still match a
    // real definition so the intended styling is applied.
    final defined = TagManager.tags.map((t) => t.name).toSet();
    for (final project in projects) {
      for (final tag in project.tags) {
        expect(defined.contains(tag.name), isTrue,
            reason: 'Project "${project.name}" uses undefined tag "${tag.name}"');
      }
    }
  });

  test('projects are ordered newest-first by startDate', () {
    for (var i = 0; i < projects.length - 1; i++) {
      expect(
        projects[i].startDate.isBefore(projects[i + 1].startDate),
        isFalse,
        reason: 'Project at index $i (${projects[i].name}) is older than the '
            'next one (${projects[i + 1].name})',
      );
    }
  });
}
