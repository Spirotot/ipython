@0xa02734eea3498650;

using Spk = import "/sandstorm/package.capnp";

const pkgdef :Spk.PackageDefinition = (

  id = "cxp85aey2qrdqvxja1zgrs0tyzq7s55qwqdwqgz12k036s3rc1yh",
  # Your app ID is actually its public key. The private key was placed in
  # your keyring. All updates must be signed with the same key.

  manifest = (
    # This manifest is included in your app package to tell Sandstorm
    # about your app.

    appTitle = (defaultText = "Eye of Jupyter"),

    appVersion = 1,  # Increment this for every release.

    appMarketingVersion = (defaultText = "4.2.2"),

    actions = [
      # Define your "new document" handlers here.
      ( title = (defaultText = "New Angr Notebook"),
        nounPhrase = (defaultText = "project"),
        command = .myCommand
        # The command to run when starting for the first time. (".myCommand"
        # is just a constant defined at the bottom of the file.)
      )
    ],

    continueCommand = .myCommand,
    # This is the command called to start your app back up after it has been
    # shut down for inactivity. Here we're using the same command as for
    # starting a new instance, but you could use different commands for each
    # case.
    metadata = (
      icons = (
        appGrid = (png = (
          dpi1x = embed "app-graphics/ipython-128.png"
        )),
        grain = (svg = ( embed "app-graphics/ipython-24.svg")),
        market =  (png = (
          dpi1x = embed "app-graphics/ipython-150.png"
        )),
      ),

      website = "https://ipython.org/",
      codeUrl = "https://github.com/Spirotot/ipython",
      license = (openSource = bsd3Clause),
      categories = [developerTools, science],

      author = (
        contactEmail = "spirotot@gmail.com",
        pgpSignature = embed "pgp-signature",
        upstreamAuthor = "Sandstorm Team",
      ),
      pgpKeyring = embed "pgp-keyring",

      description = (defaultText = embed "description.md"),
      shortDescription = (defaultText = "Computation environment"),

      screenshots = [
        (width = 448, height = 358, png = embed "sandstorm-screenshot.png")
      ],
    ),
  ),

  sourceMap = (
    searchPath = [
      ( sourcePath = "." ),  # Search this directory first.
      ( sourcePath = "/",    # Then search the system root directory.
        hidePaths = [ "home", "proc", "sys" ]
      ),
    ]
  ),

  fileList = "sandstorm-files.list",
  # `spk dev` will write a list of all the files your app uses to this file.
  # You should review it later, before shipping your app.

  alwaysInclude = [
                   "usr/local/lib/python2.7",
                   "usr/lib/python2.7",
                   "usr/lib/pymodules",
                   "usr/lib/pyshared",
                   "usr/lib/python-tz",
                   "usr/local/lib/python3.4",
                   "usr/lib/python3.4",
                   "usr/lib/python3",
                   "opt/sandstorm/latest/usr/include",
                  ],

);

const myCommand :Spk.Manifest.Command = (
  # Here we define the command used to start up your server.
  argv = ["/sandstorm-http-bridge", "8888", "--", "./launcher.sh"],
  environ = [
    # Note that this defines the *entire* environment seen by your app.
    (key = "PATH", value = "/usr/local/bin:/usr/bin:/bin"),
  ]
);
