import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_stroop_testi/oyun_stroop_testi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(renkKelimeConfig.title.length, 33);
    expect(renkKelimeConfig.tagline.length, 33);
    for (final s in renkKelimeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(renkKelimeConfig.gameId, renkKelimeId);
    expect(renkKelimeRules.gameId, renkKelimeId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(renkKelimeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: renkKelimeId, optionalMechanics: renkKelimeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(renkKelimeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
