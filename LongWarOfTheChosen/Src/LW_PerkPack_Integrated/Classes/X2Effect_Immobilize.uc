//---------------------------------------------------------------------------------------
//  FILE:   X2Effect_Immobilize.uc
//  AUTHOR:  Grobobobo/Taken  from Favid
//  PURPOSE: Effect that Immobilizes the target, and reduces their mobility instead if
//           the target is a Chosen
//---------------------------------------------------------------------------------------
class X2Effect_Immobilize extends X2Effect_PersistentStatChange;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit UnitState;

	UnitState = XComGameState_Unit(kNewTargetState);

	if (UnitState.IsChosen())
	{
		AddPersistentStatChange(eStat_Mobility, 0.5f, MODOP_PostMultiplication);
	}
	else
	{
		AddPersistentStatChange(eStat_Mobility, 0, MODOP_PostMultiplication);
		UnitState.SetUnitFloatValue(class'X2Ability_DefaultAbilitySet'.default.ImmobilizedValueName, 1);
	}
	NewGameState.AddStateObject(UnitState);

	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}

simulated function OnEffectRemoved(const out EffectAppliedData ApplyEffectParameters, XComGameState NewGameState, bool bCleansed, XComGameState_Effect RemovedEffectState)
{
	local XComGameState_Unit UnitState;

	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	if (UnitState != none)
	{
		UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.Class, UnitState.ObjectID));
		UnitState.SetUnitFloatValue(class'X2Ability_DefaultAbilitySet'.default.ImmobilizedValueName, 0);
		//NewGameState.AddStateObject(UnitState);
	}

	super.OnEffectRemoved(ApplyEffectParameters, NewGameState, bCleansed, RemovedEffectState);
}
