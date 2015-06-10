First, generate .gitmodule file. Execute command:
    make config MODULE=<modname>
Available modules are: project, demo, application, libfoo, libbar.
Next, clone module:
    ./make/scripts/clone.sh
To "build" all modules, use:
    make all
To "build" one module with name <modname>, use:
    make <modname>



