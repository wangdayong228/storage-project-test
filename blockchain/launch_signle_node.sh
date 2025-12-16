#!/bin/bash

mkdir -p blockchain_data/net_config
echo "888800000000000000000000000000000000000000000000000000000000000${param}" > ./blockchain_data/net_config/key

cp ./pos_config/private_keys/${param} ./pos_config/pos_key
./conflux -c config.toml
