## Basic configuration
## Looks a lot like a function

configuration Basic {
  
  File FirstResource {
    DestinationPath = 'c:\test.txt'
    Contents = 'Hi from the Reactor!'
  }
  
}

# The configuration defines a command
Get-Command Basic

# We need to use that command to create the
# configuration document that defines the 
# desired state of the system 
Basic

# Let's take a look at what was generated
psedit ./basic/localhost.mof

# And finally, let's make something happen
Start-DscConfiguration -Path basic -wait -Verbose