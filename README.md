- Miscreated Code completion for vscode

requires sumneko.lua extension in vscode: [Sumneko.lua](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)

either add this as a submodule in the root of your repo or download this repos files and extract.
copy the miscreated folder into a new folder called `.lua.compleations.d` in the root of your workspace - you can rename this but you must update the configuration below
then update your "Workspace" config in vscode - this example assumes your lua sources live in a subfolder below you workspace root eg:

(workspace root)
-  workspace.code-workspace
-  .lua.compleations.d/miscreated
-  workspace/Scripts/My Files

```
"Lua.runtime.version": "Lua 5.1",
  "Lua.workspace.library": {
    "../.lua.compleations.d": true
},
```
