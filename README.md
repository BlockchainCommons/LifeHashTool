# LifeHashTool

🟧🟧🟧🟧🟧<br/>
🟧🟧🟪🟧🟧<br/>
🟧🟧🟧🟪🟧<br/>
🟧🟪🟪🟪🟧<br/>
🟧🟧🟧🟧🟧<br/>

* <img src="images/logos/crypto-commons-super-simple.png" width=16 valign="bottom">&nbsp;&nbsp; ***part of the [crypto commons](https://github.com/BlockchainCommons/crypto-commons/blob/master/README.md) technology family***

### _by [Wolf McNally](https://www.github.com/wolfmcnally) and [Christopher Allen](https://www.github.com/ChristopherA)_

LifeHashTool is a command line tool written in Swift that generates [LifeHash](https://github.com/BlockchainCommons/LifeHash) images as PNG files.

LifeHashTool is distributed as a Swift package.

![LifeHash Montage](Art/montage.jpg?raw=true "Montage")

## Status - Late Alpha

`LifeHashTool` is currently under active development and in the late alpha testing phase. It should not be used for production tasks until it has had further testing and auditing.

## Installation Instructions

```sh
git clone https://github.com/BlockchainCommons/LifeHashTool.git
cd LifeHashTool/
```

Build the Debug version:

```sh
swift build
```

Build the Release version:

```sh
swift build -c release
```

Build and install the release version as `/usr/local/bin/lifehash`:

```sh
./install.sh
Password: [enter your password]
```

⚠️ **NOTE:** To avoid having to code sign, the `install.sh` script does not copy the executable: it only creates a symbolic link to it. So if you delete the `.build` directory from the `LifeHashTool` directory, the link will no longer resolve.

⚠️ **NOTE:** As of the release of LifeHash 6, LifeHashTool generates `.version2` LifeHashes by default.

## Usage Instructions

Print the help:

```sh
lifehash --help

Usage: lifehash [OPTION...] [INPUT]

  -v VERSION      [version1|version2|detailed|fiducial|grayscaleFiducial] (default: version2)
  -m MODULE_SIZE  Size of each module ("pixel") (default: 1)
  -p OUTPUT_PATH  (default: current directory)

  -h --help       Print this message.

* The output PNG file will have the same name as the INPUT string.

* If no INPUT string is provided, a random one will be generated of the form "XXX-XXX" where X is a random letter.
```

Generate a `version2`, 32x32 pixel LifeHash in the current directory from the string "0":

```sh
lifehash 0

ls
0.png
```

Generate a `detailed`, 64x64 pixel LifeHash in the current directory with a randomly generated name of the form "XXX-XXX" where X is a random letter.

```sh
lifehash -v detailed

ls
OKS-OID.png
```

Generate the same LifeHash as above, but use a module size of 8, resulting in a 512x512 image:

```sh
lifehash -v detailed -m 8 OKS-OID

ls
OKS-OID.png
```

Use the included `make-examples.sh` script to generate 30 `fiducial` LifeHashes with a module size of 8 in the directory `./output`:

```sh
./make-examples.sh fiducial 30 8

ls ./output
BUE-WZC.png DSP-IIK.png KHO-GQH.png LOV-CZL.png NFD-VWY.png TGE-JLS.png YBN-ZOU.png ZTW-ZWN.png
BZV-HHP.png EDB-HDG.png KIB-OFT.png LUV-VRB.png NNY-TRP.png THL-IRO.png ZJB-ZAS.png ZVS-BEH.png
CAJ-TQC.png ILF-JLC.png KPS-VYZ.png MMT-HRP.png RVG-VZO.png URG-VKN.png ZQS-QHK.png
DEZ-ZZS.png JBS-XMX.png KTG-XAW.png MOJ-SGW.png SSV-ZBF.png XFF-APN.png ZQZ-TEX.png
```

Use [ImageMagick `montage`](https://imagemagick.org/script/montage.php) to create a montage of the images you just generated:

```sh
montage output/* montage.jpg
open montage.jpg
```
## Origin, Authors, Copyright & Licenses

Unless otherwise noted (either in this [/README.md](./README.md) or in the file's header comments) the contents of this repository are Copyright © 2020 by Blockchain Commons, LLC, and are [licensed](./LICENSE) under the [spdx:BSD-2-Clause Plus Patent License](https://spdx.org/licenses/BSD-2-Clause-Patent.html).

In most cases, the authors, copyright, and license for each file reside in header comments in the source code. When it does not, we have attempted to attribute it accurately in the table below.

This table below also establishes provenance (repository of origin, permalink, and commit id) for files included from repositories that are outside of this repo. Contributors to these files are listed in the commit history for each repository, first with changes found in the commit history of this repo, then in changes in the commit history of their repo of their origin.

| File      | From                                                         | Commit                                                       | Authors & Copyright (c)                                | License                                                     |
| --------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------ | ----------------------------------------------------------- |
| exception-to-the-rule.c or exception-folder | [https://github.com/community/repo-name/PERMALINK](https://github.com/community/repo-name/PERMALINK) | [https://github.com/community/repo-name/commit/COMMITHASH]() | 2020 Exception Author  | [MIT](https://spdx.org/licenses/MIT)                        |

### Dependencies

To build  `LifeHashTool` you'll need to use the following tools:

- Xtools with Swift (or another Swift compiler)

### Derived from…

This  `LifeHashTool` project is either derived from or was inspired by:


- [LifeHash](https://github.com/BlockchainCommons/LifeHash) — Repo that does what, by [developer](https://github.com/developer)  or from  [community](https://community.com).

### Used with…

These are other projects that work with or leverage `LifeHashTool`:

- [community/repo-name/](https://github.com/community/repo-name) — Repo that explains Lifehash, by [WolfMcNally](https://github.com/wolfmcnally).

## Financial Support

`LifeHashTool` is a project of [Blockchain Commons](https://www.blockchaincommons.com/). We are proudly a "not-for-profit" social benefit corporation committed to open source & open development. Our work is funded entirely by donations and collaborative partnerships with people like you. Every contribution will be spent on building open tools, technologies, and techniques that sustain and advance blockchain and internet security infrastructure and promote an open web.

To financially support further development of `$projectname` and other projects, please consider becoming a Patron of Blockchain Commons through ongoing monthly patronage as a [GitHub Sponsor](https://github.com/sponsors/BlockchainCommons). You can also support Blockchain Commons with bitcoins at our [BTCPay Server](https://btcpay.blockchaincommons.com/).

### Project Sponsors

Thanks to our project sponsors for their support of `$projectname`:

$sponsor-logo-with-link

$sponsor-description

## Contributing

We encourage public contributions through issues and pull requests! Please review [CONTRIBUTING.md](./CONTRIBUTING.md) for details on our development process. All contributions to this repository require a GPG signed [Contributor License Agreement](./CLA.md).

### Discussions

The best place to talk about Blockchain Commons and its projects is in our GitHub Discussions areas.

[**Gordian System Discussions**](https://github.com/BlockchainCommons/Gordian/discussions). For users and developers of the Gordian system, including the Gordian Server, Bitcoin Standup technology, QuickConnect, and the Gordian Wallet. If you want to talk about our linked full-node and wallet technology, suggest new additions to our Bitcoin Standup standards, or discuss the implementation our standalone wallet, the Discussions area of the [main Gordian repo](https://github.com/BlockchainCommons/Gordian) is the place.

[**Wallet Standard Discussions**](https://github.com/BlockchainCommons/AirgappedSigning/discussions). For standards and open-source developers who want to talk about wallet standards, please use the Discussions area of the [Airgapped Signing repo](https://github.com/BlockchainCommons/AirgappedSigning). This is where you can talk about projects like our [LetheKit](https://github.com/BlockchainCommons/bc-lethekit) and command line tools such as [seedtool](https://github.com/BlockchainCommons/bc-seedtool-cli), both of which are intended to testbed wallet technologies, plus the libraries that we've built to support your own deployment of wallet technology such as [bc-bip39](https://github.com/BlockchainCommons/bc-bip39), [bc-slip39](https://github.com/BlockchainCommons/bc-slip39), [bc-shamir](https://github.com/BlockchainCommons/bc-shamir), [Shamir Secret Key Recovery](https://github.com/BlockchainCommons/bc-sskr), [bc-ur](https://github.com/BlockchainCommons/bc-ur), and the [bc-crypto-base](https://github.com/BlockchainCommons/bc-crypto-base). If it's a wallet-focused technology or a more general discussion of wallet standards,discuss it here.

[**Blockchain Commons Discussions**](https://github.com/BlockchainCommons/Community/discussions). For developers, interns, and patrons of Blockchain Commons, please use the discussions area of the [Community repo](https://github.com/BlockchainCommons/Community) to talk about general Blockchain Commons issues, the intern program, or topics other than the [Gordian System](https://github.com/BlockchainCommons/Gordian/discussions) or the [wallet standards](https://github.com/BlockchainCommons/AirgappedSigning/discussions), each of which have their own discussion areas.

### Other Questions & Problems

As an open-source, open-development community, Blockchain Commons does not have the resources to provide direct support of our projects. Please consider the discussions area as a locale where you might get answers to questions. Alternatively, please use this repository's [issues](./issues) feature. Unfortunately, we can not make any promises on response time.

If your company requires support to use our projects, please feel free to contact us directly about options. We may be able to offer you a contract for support from one of our contributors, or we might be able to point you to another entity who can offer the contractual support that you need.

### Credits

The following people directly contributed to this repository. You can add your name here by getting involved. The first step is learning how to contribute from our [CONTRIBUTING.md](./CONTRIBUTING.md) documentation.

| Name              | Role                | Github                                            | Email                                 | GPG Fingerprint                                    |
| ----------------- | ------------------- | ------------------------------------------------- | ------------------------------------- | -------------------------------------------------- |
| Christopher Allen | Principal Architect | [@ChristopherA](https://github.com/ChristopherA) | \<ChristopherA@LifeWithAlacrity.com\> | FDFE 14A5 4ECB 30FC 5D22  74EF F8D3 6C91 3574 05ED |
| Wolf McNally      | Project Lead        | [@WolfMcNally](https://github.com/wolfmcnally)    | \<Wolf@WolfMcNally.com\>              | 9436 52EE 3844 1760 C3DC  3536 4B6C 2FCF 8947 80AE |

## Responsible Disclosure

We want to keep all of our software safe for everyone. If you have discovered a security vulnerability, we appreciate your help in disclosing it to us in a responsible manner. We are unfortunately not able to offer bug bounties at this time.

We do ask that you offer us good faith and use best efforts not to leak information or harm any user, their data, or our developer community. Please give us a reasonable amount of time to fix the issue before you publish it. Do not defraud our users or us in the process of discovery. We promise not to bring legal action against researchers who point out a problem provided they do their best to follow the these guidelines.

### Reporting a Vulnerability

Please report suspected security vulnerabilities in private via email to ChristopherA@BlockchainCommons.com (do not use this email for support). Please do NOT create publicly viewable issues for suspected security vulnerabilities.

The following keys may be used to communicate sensitive information to developers:

| Name              | Fingerprint                                        |
| ----------------- | -------------------------------------------------- |
| Christopher Allen | FDFE 14A5 4ECB 30FC 5D22  74EF F8D3 6C91 3574 05ED |

You can import a key by running the following command with that individual’s fingerprint: `gpg --recv-keys "<fingerprint>"` Ensure that you put quotes around fingerprints that contain spaces.
