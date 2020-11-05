# lists paths that contain elixir modules
:code.get_path


## dynamic calling gunctions

# Kernel.apply -> MFA , module, function argument
apply(IO, :puts, ["Dyanmic function call"])
