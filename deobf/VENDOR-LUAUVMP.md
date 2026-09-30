The `luauvmp` Python sources and the two Luraph dispatcher-recovery helpers in
`tools/` are vendored from the user-provided `luau-vmp-deobf-main.zip` archive
(version 0.5.2). Their MIT license is included at `luauvmp/LICENSE`.

The desktop integration calls only the local `luraph_auto.run_full_loader`
pipeline. It does not call the optional lua.expert upload/readability stage.
The pipeline can execute a bounded parser/bootstrap under Lune's lexical
sandbox, but disables the final protected application payload. The UI result
and JSON report keep source equivalence marked unverified.
