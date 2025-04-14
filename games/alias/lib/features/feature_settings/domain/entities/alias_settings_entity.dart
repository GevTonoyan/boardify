import 'package:alias/core/constants.dart';

/// This class represents the settings for the Alias game.
/// It contains various properties that define the game settings.
class AliasSettingsEntity {
  final int gameDuration;
  final int pointsToWin;
  final bool soundEnabled;
  final bool allowSkipping;
  final bool penaltyForSkipping;
  final int wordsPerCard;

  const AliasSettingsEntity({
    this.gameDuration = AliasConstants.defaultGameDuration,
    this.pointsToWin = AliasConstants.defaultPointsToWin,
    this.soundEnabled = true,
    this.allowSkipping = true,
    this.penaltyForSkipping = true,
    this.wordsPerCard = AliasConstants.defaultWordsPerCard,
  });

  factory AliasSettingsEntity.initial() {
    return const AliasSettingsEntity(
      gameDuration: AliasConstants.defaultGameDuration,
      pointsToWin: AliasConstants.defaultPointsToWin,
      soundEnabled: true,
      allowSkipping: true,
      penaltyForSkipping: true,
      wordsPerCard: AliasConstants.defaultWordsPerCard,
    );
  }

  factory AliasSettingsEntity.fromPreferences({
    int? gameDuration,
    int? pointsToWin,
    bool? soundEnabled,
    bool? allowSkipping,
    bool? penaltyForSkipping,
    int? wordsPerCard,
  }) {
    return AliasSettingsEntity(
      gameDuration: gameDuration ?? AliasConstants.defaultGameDuration,
      pointsToWin: pointsToWin ?? AliasConstants.defaultPointsToWin,
      soundEnabled: soundEnabled ?? true,
      allowSkipping: allowSkipping ?? true,
      penaltyForSkipping: penaltyForSkipping ?? true,
      wordsPerCard: wordsPerCard ?? AliasConstants.defaultWordsPerCard,
    );
  }

  AliasSettingsEntity copyWith({
    int? gameDuration,
    int? pointsToWin,
    bool? soundEnabled,
    bool? allowSkipping,
    bool? penaltyForSkipping,
    int? wordsPerCard,
  }) {
    return AliasSettingsEntity(
      gameDuration: gameDuration ?? this.gameDuration,
      pointsToWin: pointsToWin ?? this.pointsToWin,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      allowSkipping: allowSkipping ?? this.allowSkipping,
      penaltyForSkipping: penaltyForSkipping ?? this.penaltyForSkipping,
      wordsPerCard: wordsPerCard ?? this.wordsPerCard,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! AliasSettingsEntity) {
      return false;
    }

    return gameDuration == other.gameDuration &&
        pointsToWin == other.pointsToWin &&
        soundEnabled == other.soundEnabled &&
        allowSkipping == other.allowSkipping &&
        penaltyForSkipping == other.penaltyForSkipping &&
        wordsPerCard == other.wordsPerCard;
  }

  @override
  String toString() {
    return 'AliasSettingsEntity(gameDuration: $gameDuration, pointsToWin: $pointsToWin, soundEnabled: $soundEnabled, allowSkipping: $allowSkipping, skipPenalty: $penaltyForSkipping, wordsPerCard: $wordsPerCard)';
  }

  @override
  int get hashCode {
    return gameDuration.hashCode ^
        pointsToWin.hashCode ^
        soundEnabled.hashCode ^
        allowSkipping.hashCode ^
        penaltyForSkipping.hashCode ^
        wordsPerCard.hashCode;
  }
}
