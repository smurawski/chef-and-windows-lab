# Setup

## Workstation

* Windows Server 2012 R2 with WMF 5 RTM and ChefDK 0.13 (or newer)

# Exercises

## Build a Chef recipe to make the pester tests pass

*Site content can be found at http://blogs.msdn.com/cfs-file.ashx/__key/communityserver-blogs-components-weblogfiles/00-00-00-63-74-metablogapi/3124.Demo_5F00_WindowServer2012R2_2D00_Preview_5F00_4677B514.zip'*

*In the Demo_WindowServer2012R2-Preview\PreReq\BakeryWebsite\ directory*

### Start with the basics

#### Most websites on Windows Server live in IIS

* So, lets build a check for what IIS related features are installed (and not installed).

  * Example; 0-structural.Tests.ps1

* What are some other structural tests we might need or want?

* Let's build a recipe

* Ok, now let's write some tests around how the website behaves

* Guess what is coming next?

