# install os
FROM ubuntu
# install dependencies
RUN apt-get -y update && apt-get -y install make gcc libssl-dev libpcre3-dev
# copy source files into docker
ADD . /vanitygen
# build the binary
RUN cd /vanitygen; make
# run the shell
CMD ["/bin/bash"]

# now check that you have a working binary:
#  cd /vanitygen
#  ./vanitygen


# you should see this output:
###   Vanitygen 0.22 (OpenSSL 1.0.2g  1 Mar 2016)
###   Usage: ./vanitygen [-vqnrik1NT] [-t <threads>] [-f <filename>|-] [<pattern>...]
###   Generates a Litecoin Cash receiving address matching <pattern>, and outputs the
###   address and associated private key.  The private key may be stored in a safe
###   location or imported into a bitcoin client to spend any balance received on
###   the address.
###   By default, <pattern> is interpreted as an exact prefix.
###   
###   Options:
###   -v            Verbose output
###   -q            Quiet output
###   -n            Simulate
###   -r            Use regular expression match instead of prefix
###                 (Feasibility of expression is not checked)
###   -i            Case-insensitive prefix search
###   -k            Keep pattern and continue search after finding a match
###   -1            Stop after first match
###   -N            Generate namecoin address
###   -T            Generate bitcoin testnet address
###   -X <version>  Generate address with the given version
###   -F <format>   Generate address with the given format (pubkey or script)
###   -P <pubkey>   Specify base public key for piecewise key generation
###   -e            Encrypt private keys, prompt for password
###   -E <password> Encrypt private keys with <password> (UNSAFE)
###   -t <threads>  Set number of worker threads (Default: number of CPUs)
###   -f <file>     File containing list of patterns, one per line
###                 (Use "-" as the file name for stdin)
###   -o <file>     Write pattern matches to <file>
###   -s <file>     Seed random number generator from <file>