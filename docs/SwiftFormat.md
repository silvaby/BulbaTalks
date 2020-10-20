# SwiftFormat

This file describes how to set up and integrate SwiftFormat into our project.

## How to set up the environment

- Install SwiftFormat (version 0.44.7) via Homebrew

```bash
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/5b81b0915660fd159c0bb3e98783a28b258bf7fb/Formula/swiftformat.rb
```

- Disable upgrade via Homebrew

```bash
brew pin swiftformat
```

- [Integrate SwiftFormat into an Xcode scheme](https://github.com/nicklockwood/SwiftFormat#alternative-locally-installed-swiftformat). Just add a new ["Run Script Phase"](https://stackoverflow.com/questions/39632301/where-is-the-run-script-and-build-phase-in-xcode)

## How to configure SwiftFormat

We are currently using the default set of rules of SwiftFormat (`.swiftformat` file is empty now). And you can find all available rules [here](https://github.com/nicklockwood/SwiftFormat/blob/master/Rules.md).

You can [configure SwiftFormat](https://github.com/nicklockwood/SwiftFormat#configuration) by modifying the [.swiftformat](../.swiftformat) file. All changes must be agreed with the team.

## Swift version

[Swift version](https://github.com/nicklockwood/SwiftFormat#swift-version) is listed in the [.swift-version](../.swift-version) file.

## Useful links

- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat)
