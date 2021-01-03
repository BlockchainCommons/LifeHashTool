# LifeHashTool

🟧🟧🟧🟧🟧<br/>
🟧🟧🟪🟧🟧<br/>
🟧🟧🟧🟪🟧<br/>
🟧🟪🟪🟪🟧<br/>
🟧🟧🟧🟧🟧<br/>

**© 2020 Blockchain Commons**

Original Author: [Wolf McNally](https://github.com/wolfmcnally)

---

LifeHashTool is a command line tool written in Swift that generates [LifeHash](https://github.com/BlockchainCommons/LifeHash) images as PNG files.

LifeHashTool is distributed as a Swift package.

![LifeHash Montage](Art/montage.jpg?raw=true "Montage")

## Building and Installation

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

## Usage

Print the help:

```sh
lifehash --help

Usage: lifehash [OPTION...] [INPUT]

  -v VERSION      [original|detailed|fiducial|grayscaleFiducial] (default: original)
  -m MODULE_SIZE  Size of each module ("pixel") (default: 1)
  -p OUTPUT_PATH  (default: current directory)

  -h --help       Print this message.

* The output PNG file will have the same name as the INPUT string.

* If no INPUT string is provided, a random one will be generated of the form "XXX-XXX" where X is a random letter.
```

Generate an `original`, 32x32 pixel LifeHash in the current directory from the string "0":

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
