import os

# Path to the directory containing your modules
your_modules_dir = "/run/media/kjones/build/android/lineage_samsung/out/target/product/gts9wifi/obj/PACKAGING/depmod_recovery_intermediates/lib/modules/0.0/lib/modules"

# Read the list of modules you provided from a text file
with open("modules.load.recovery", "r") as file:
    provided_modules = file.read().splitlines()

# Get the list of modules you have in the specified directory
your_modules = os.listdir(your_modules_dir)

# Find the missing modules
missing_modules = set(provided_modules) - set(your_modules)

# Print the missing modules
print("Missing modules:")
for module in missing_modules:
    print(module)

