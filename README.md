LoLLocker
===

Bash based cryptolocker

I wrote this in a hack/prep night to for the [information security talent search](http://ists.sparsa.org/) (ISTS) @ Rochester Institute of Technology.

Please improve/learn from this, its academic code and in no way do I endorse using this for evil.

Run
===

Change URL on line 11 from https://droppersite.com to your serv.

Things to note:

I have a white_list to make sure you dont encrypt everything, it encrypts everything in the target directory. You can instead substitute this for a file extension list and only encrypt those extensions and filter through sed

Encrypt
==

```./lol.sh password targetdir```

Decrypt
==

```./dec.sh password iv targetdir```

Things it doesnt do
===

Ideally, port a pub key to encrypt the symmetric key:IV to send that as one parameter when you encrypt everything.

Also, separate IV per file, and better encrypted file detection (magic values prepended/appended instead of an extension is ideal)

