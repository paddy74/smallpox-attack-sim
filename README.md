# SMLNJ Smallpox Attack Simulator
Simulates a disease outbreak using [Standard ML of New Jersey](https://www.smlnj.org/).

This program was created for CS355: Principles of Programming Languages at Old Dominion University.

### Prerequisites
You will need [Standard ML of New Jersey](https://www.smlnj.org/)
```
sudo apt install smlnj
```
The population generator is set up to build using CMake
```
sudo apt install cmake
```

### Setup
The population generator is set up to build using CMake
```
cd src/PopGen/
mkdir build && cd build
cmake .. && make
./popGen
```
This will generate "groups.data" which must be moved to the directory containing main.sml
```
mv groups.data ../../
```

## Running the Application
From the src directory
```
sml -s main.sml
```

## Built With
* [Standard ML of New Jersey](https://www.smlnj.org/)

## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning
We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository]().

## Authors
* **Patrick Cox** - *Contributor* - [paddy74](https://github.com/paddy74)
* **Caroline Kuzio** - *Contributor* - [ckoozie](https://github.com/ckoozie)

See also the list of [contributors](https://github.com/paddy74/smallpox-attack-sim/graphs/contributors) who participated in this project.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments
* Our professor [Jay Morris](http://www.cs.odu.edu/~jdm/)
