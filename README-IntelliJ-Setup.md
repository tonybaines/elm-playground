# Configuring and Using IntelliJ IDEA for basic Elm development

Assumes an elm toolchain installed through NPM

`npm install -g elm elm-test elm-format`

## Versions
* Elm 0.18
* IntelliJ IDEA 2017.3.4

## IntelliJ Plugins
* Elm Language Plugin (https://durkiewicz.github.io/elm-plugin/)
  * Other and newer plugins are available, but they didn't work well with `elm-test`
* File Watchers (JetBrains)


## IntelliJ Configuration

### Modules (assuming existing sources)

* Project Structure (Ctrl-Alt-Shift-S)
  * Modules
    * Add -> Import Module
    * Select source directory
    * Create module from existing sources
    * Next, Next, Finish
  * Repeat for `tests` sub-folder
    * Needs to be a separate module or compilation fails

### External Tools

* Settings (Ctrl-Alt-S)
  * Tools -> External Tools
  
|Program|Arguments|Working directory|
|-------|---------|-----------------|
|`elm-reactor`|-|`$ModuleFileDir$`|
|`elm-format`|`--elm-version 0.18 --yes "$FilePath$" `|`$ProjectFileDir$`|
|`elm-test`|`$FileDirName$/$FileName$`|`$ModuleFileDir$/..`|

### File Watchers

* Settings (Ctrl-Alt-S)
  * Tools -> File Watchers
  
|Program|Arguments|
|-------|---------|
`elm-format`|`--elm-version 0.18 --yes "$FilePath$" `|

Untick _Auto-save edited files to trigger the watcher_

### Key Bindings

* Settings (Ctrl-Alt-S)
  * Keymap -> External Tools
    * `elm-format` *Alt+E, Alt+L*
    * `elm-reactor` *Alt+E, Alt+R*
    * `elm-test` *Alt+E, Alt+T*
