# Long War of the Chosen (LWOTC)

This is a port of [Pavonis Interactive](https://www.pavonisinteractive.com/)'s
Long War 2 (LW2) overhaul mod for XCOM 2 to the War of the Chosen (WOTC)
expansion and update it for WOTC's new features.

## Installing and playing the mod

Long War of the Chosen is primarily distributed through Steam Workshop, in a few varieties:

### Main release
[The main release](https://steamcommunity.com/sharedfiles/filedetails/?id=2683996590) stays unchanging for longer periods of time, mostly receiving bugfixes and localization updates. More experimental changes enter this item only after they've been adequately tested. This version is recommended if you're just starting or are otherwise unsure about which to choose.

### Beta release
[The beta release](https://steamcommunity.com/sharedfiles/filedetails/?id=2663990965) receives more rapid and experimental updates, to be evaluated by the community. This version is recommended if you want to actively provide feedback or otherwise want the most cutting edge changes. However, note that this version can introduce more frequent and more serious bugs than the main.

### 1.0 archive release
[The 1.0 archive release](https://steamcommunity.com/sharedfiles/filedetails/?id=3114647033) is only recommended if you have a campaign started before the release of 1.1 and are worried that its changes cause instability or imbalance.

## Contributing translations

If you would like to contribute to translations for LWOTC, then check out the
[wiki page](https://github.com/long-war-2/lwotc/wiki/Contributing#localization-translating-text-in-the-game)
that explains how it works.

## Building and running the mod

You will only need to read this section if you'd like to contribute code or assets to the project. It is also useful for localization work, but not required.

The primary development branch is [beta branch](https://github.com/long-war-2/lwotc/tree/beta). Due to differences in build steps between that and [master](https://github.com/long-war-2/lwotc/tree/master) (the stable branch), these instructions are only maintained for **beta**.

Note that you need to own the Shen's Last Gift DLC to build (and play) this version of the mod.

 1. Make sure you have the WOTC SDK `full_content` branch installed - see the
    [r/xcom2mods wiki](https://www.reddit.com/r/xcom2mods/wiki/index#wiki_setting_up_tools_for_modding)
    for details on how to do that (plus lots of other useful information)

 1. Set up the following environment variables:
    * `XCOM2SDKPATH` — typically &lt;path to Steam&gt;\steamapps\common\XCOM 2 War Of The Chosen SDK
    * `XCOM2GAMEPATH` — typically &lt;path to Steam&gt;\steamapps\common\XCOM 2\XCom2-WarOfTheChosen
    Don't put these paths in quotes.

 1. [Fork this repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
    and then clone your fork locally, which you can do via [Git for Windows](https://gitforwindows.org/)
    (a command-line tool), [GitHub Desktop](https://desktop.github.com/), or some other
    Git client tool. This is also a good time to switch to the `beta` branch (e.g. `git switch beta`).

 1. Once you have cloned the repository, you may need to pull the code for the embedded
    highlander. If the *X2WOTCCommunityHighlander* directory is empty, then use the
    command line from the project's root directory (the one containing this README.md):
    ```
        > git submodule update --init
    ```
    or whatever is the equivalent with the Git client tool you are using.

 1. Download the LWOTC media assets (video, graphics and sound) from
    [this Google Drive link](https://drive.google.com/file/d/1ll6xOAQH71By8HRdt-apCTizcS0aU8h9/view?usp=sharing)
    and unpack the resulting zip file into this project's *LongWarOfTheChosen* directory. It should merge the contents of the *Content* and *ContentForCook* directories.

 1. Modify some files in your WOTC SDK's `SrcOrig`:
    * In `X2SitRepEffect_ModifyKismetVariable.uc`, modify line 27
    ```
    private native function ModifyKismetVariablesInternal(XComGameState NewGameState);
    ```
    to
    ```
    native function ModifyKismetVariablesInternal(XComGameState NewGameState);
    ```

    * In `XComPlotCoverParcelManager.uc`, modify line 6
    ```
    var const config array<PCPDefinition> arrAllPCPDefs;
    ```
    to
    ```
    var config array<PCPDefinition> arrAllPCPDefs;
    ```

 1. Copy `NewPromotionScreenByDefault` to your `SrcOrig`. You should already be subscribed to the mod [[WOTC] Community Promotion Screen](https://steamcommunity.com/sharedfiles/filedetails/?id=2550561145) (it's a required mod for LWOTC). Locate it in your Workshop mods folder, typically &lt;path to Steam&gt;\steamapps\workshop\content\268500\2550561145. Under `Src`, there is a folder `NewPromotionScreenbyDefault`. Copy it under your SDK's `SrcOrig` (so that you have `Src\NewPromotionScreenbyDefault`).

 1. Run the following from the LWOTC project directory:
    ```
    > build-lwotc.bat -config default
    ```
    (You can specify `-config debug` to compile with debug info)

Once LWOTC is built, you will be able to select it as a local mod in Alternative Mod Launcher and run Long War of the Chosen.

## Contributing

Contributions are welcome. If you just want to raise issues, please do so [on GitHub](https://github.com/long-war-2/lwotc/issues),
preferably including a save file if possible.

If you wish to contribute to development — and this project will rely heavily on such contributions — then please
look through the issues and if you want tackle one, just leave a comment along the lines of "I'll take this one".
If you find you can't complete the issue in a reasonable time, please add another comment that says you're relinquishing
the issue.

All contributions are welcome, but bug fixes are _extremely_ welcome!

## Acknowledgements

 * Track Two, who has provided a huge amount of advice and insight that saved me lots of time
   and ensured certain bugs got fixed at all.
 * The folks behind X2WOTCCommunityHighlander.
 * All the folks in XCOM 2 modders' Discord who have answered my questions.
 * All the authors of the mods that are integrated into this port:
   - robojumper's Squad Select
   - Detailed Soldier List
 * The Long War 2 team for producing the mod in the first place!
