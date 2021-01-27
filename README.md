# project_c_sample
A C project makefile sample which manages the c source conveniently
# characteristic
````
1. auto generate the dependencies, and auto detect src files.
2. if the *.c files or *.h files modified or added, only related objects are auto-recompile.
3. the files and dir-trees is very neat 
4. you can create just a module by execute [make libmod1] to just generate one lib
bug1: if deleted an h file, the make tools will try to find rules to generate it.
bug2: if deleted a c file, the make tools not detect it.
NOTE: please execute [make clean && make] when some files deleted.
````

# Using steps
````
1. put your C source files into mod1(2)/src/subdir1(2) and the header files to mod1(2)/include/subdir1(2)
2. run make at the root dir, it will generate the libmod.a
````
# Futher Jobs
````
1. add config file to manage the modules
2. put menuconfig dirs to mangage the config file, like the linux project
````
