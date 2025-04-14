sealed class AliasSettingsEvent {
  const AliasSettingsEvent();
}

class GetAliasSettings extends AliasSettingsEvent {
  const GetAliasSettings();
}

class ChangeGameDuration extends AliasSettingsEvent {
  final int gameDuration;

  const ChangeGameDuration(this.gameDuration);
}

class ChangePointsToWin extends AliasSettingsEvent {
  final int pointsToWin;

  const ChangePointsToWin(this.pointsToWin);
}

class ChangeSoundEffects extends AliasSettingsEvent {
  final bool soundEffects;

  const ChangeSoundEffects(this.soundEffects);
}

class ChangeAllowSkipping extends AliasSettingsEvent {
  final bool allowSkipping;

  const ChangeAllowSkipping(this.allowSkipping);
}

class ChangePenaltyForSkipping extends AliasSettingsEvent {
  final bool penaltyForSkipping;

  const ChangePenaltyForSkipping(this.penaltyForSkipping);
}

class ChangeWordsPerCard extends AliasSettingsEvent {
  final int wordsPerCard;

  const ChangeWordsPerCard(this.wordsPerCard);
}
