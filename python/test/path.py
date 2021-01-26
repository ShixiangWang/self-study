# Python 3.6 or higher
from pathlib import Path

cwd = Path.cwd()
print("Current working directory:\n" + str(cwd))

new_file = Path.joinpath(cwd, "new_file.txt")
print("\nFull path:\n" + str(new_file))

print(new_file.exists())

parent = cwd.parent
print(parent)

print(parent.is_dir())
print(parent.is_file())

# List child directories
print("\n----directory contents------")
for child in parent.iterdir():
  if child.is_dir():
    print(child)

# file info
demo_file = Path(Path.joinpath(cwd, "demo.txt"))

print("file name: " + demo_file.name)
print("file suffix: " + demo_file.suffix)
print("file folder: " + demo_file.parent.name)
print("file size: " + str(demo_file.stat().st_size))