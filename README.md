- Miscreated Code completion for vscode

requires sumneko.lua extension in vscode: [Sumneko.lua](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)

either add this as a submodule in the root of your repo or download this repos files and extract somwhere.
then update your "Workspace" config in vscode
```
"Lua.runtime.version": "Lua 5.1",
  "Lua.workspace.library": {
    "../.lua.compleations.d": true
},
```
