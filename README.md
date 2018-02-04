# gaussian16

### What is this?

I was tasked with deploying [Gaussian 16](http://gaussian.com/gaussian16/), some scientific software, on modern versions of OS X. I'm publishing this code in hopes of making it easier for other people in my position. Please see the [Gaussian 16](http://gaussian.com/g16/g16m_install.pdf) and [GaussView 6](http://gaussian.com/g16/gvm_install.pdf) installation instructions for more information.

### Requirements

As the code is written, you'll need [outset](https://github.com/chilcote/outset) and [The Luggage](https://github.com/unixorn/luggage). [Munki](https://github.com/munki/munki) is optional. You'll also need my [luggage.local file](https://github.com/flammable/luggage_local).  If you know what you're doing, feel free to modify this to be more generic.  I mostly just want this to be out there, in case anyone faces the same request.

You'll also need two files, provided by the developer: `gv-6016-MacOSX_x86_64.tbz` and `M64-108X.tbz`.  This is the Gaussian 16 and GaussView software, copied from the discs.  I cannot provide these files.  Place them in the same directory as this repository.

### How do I use this?

You'll need to make some modifications.  First, check out `add_gaussian_user.applescript`.  The installation manual specifies that you'll need to create a specific group of users for this software.  We decided that'd be too much work, so we specified the "everyone" group instead - it turns out the software checks for that and refuses to work correctly if the permissions aren't narrow enough.  We finally gave in and made a 'gaussian' group (it's part of the included preinstall and postinstall scripts).  This AppleScript, saved as an application, assists users in adding domain accounts to the new 'gaussian' group.  Be sure to change the `SJU-VMAD\\` portion to your domain.  In our case, it's AD, but this should work with AD, OD, LDAP, etc.  Save it as an application called "Add Gaussian User" and deploy it to `/Applications`.

As part of deploying this application, you'll need to instruct your users to run the 'Add Gaussian User' application to give users access to both applications.  'Add Gaussian User' requires administrator privileges.

Beyond that, you should be fine to `cd` into this directory, and run `make dmg`, `make pkg`, or `make munkiimport`.