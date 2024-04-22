#!/usr/bin/env bash

# Function to encrypt strings
encrypt_string() {
    local string_to_encrypt="$1"
    local password="$2"
    
    # Encrypt and encode in base64, remove potential newlines
    echo -n "$string_to_encrypt" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -iter 10000 -pass pass:"$password"
}

# Function to decrypt strings
decrypt_string() {
    local string_to_decrypt="$1"
    local password="$2"
    
    # Decrypt from base64 encoded string
    echo -n "$string_to_decrypt" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -iter 10000 -pass pass:"$password"
}

# Original function definition
setup_private_keys() {
    op account add --address my.1password.com --email isethi@me.com --secret-key A3-6MZ77J-7VD5YB-MDJ72-XWFK6-TDEYN-B48WC --signin
    eval $(op signin --account my)

    ssh_key_location="op://gaudmygc2h2ekq6o7dpt43ipuq/icqfxd3supyxuzmdwto6634zme/private key"
    ssh_key=$(op read "$ssh_key_location")
    echo "SSH Key: "
    echo $ssh_key
}

# Serialize the function along with a call to the function
function_definition=$(declare -f setup_private_keys)
call_function='setup_private_keys'

# Encrypt the function definition along with the function call
password="your_encryption_password"
encrypted_function=$(encrypt_string "$function_definition; $call_function" "$password")
echo "Encrypted Function: $encrypted_function"

# Decrypt and execute the function later
decrypted_function=$(decrypt_string "$encrypted_function" "$password")
echo "Decrypted Function: $decrypted_function"
eval "$decrypted_function"  # Redefine and call the function in the current shell
#!/bin/bash

# Function to encrypt strings
encrypt_string() {
    local string_to_encrypt="$1"
    local password="$2"
    
    # Encrypt and encode in base64, remove potential newlines
    echo -n "$string_to_encrypt" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -iter 10000 -pass pass:"$password"
}

# Function to decrypt strings
decrypt_string() {
    local string_to_decrypt="$1"
    local password="$2"
    
    # Decrypt from base64 encoded string
    echo -n "$string_to_decrypt" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -iter 10000 -pass pass:"$password"
}

# Original function definition
setup_private_keys() {
    op account add --address my.1password.com --email isethi@me.com --secret-key A3-6MZ77J-7VD5YB-MDJ72-XWFK6-TDEYN-B48WC --signin
    
    ssh_key_location="op://gaudmygc2h2ekq6o7dpt43ipuq/icqfxd3supyxuzmdwto6634zme/private key"
    ssh_key=$(op read $ssh_key_location)
    echo "SSH Key: "
    echo $ssh_key
}

# Serialize the function along with a call to the function
function_definition=$(declare -f setup_private_keys)
call_function='setup_private_keys'

# Encrypt the function definition along with the function call
password="your_encryption_password"
encrypted_function=$(encrypt_string "$function_definition; $call_function" "$password")
echo "Encrypted Function: $encrypted_function"

# Decrypt and execute the function later
decrypted_function=$(decrypt_string "$encrypted_function" "$password")
echo "Decrypted Function: $decrypted_function"
eval "$decrypted_function"  # Redefine and call the function in the current shell

rsa_key=$(eval "$decrypted_function")
echo "##########"
echo rsa_key
echo "#########"

# starting from an encrypted string
decrypt_string() {
	local string_to_decrypt="$1"
	local password="$2"
	
	# Decrypt from base64 encoded string
	echo -n "$string_to_decrypt" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -iter 10000 -pass pass:"$password"
}

password="your_encryption_password"

encrypted_function="U2FsdGVkX1/BreIMbBtxF29l2vMoOfRb9kylnjFLRm4iKWjtJ9v+3QCP3SY016cj
CwTXyKGSvRbJmN1jrTs1neI2wxMhZLOW4bePjJMNVTYnfnL1XkJtBS1AibHnrcJm
rgdzKJppZWKnNV4jEAGNWat6TsaNOyMQqi5mvaTyYdCcG7zZt2EwkTRuxjzaATFI
5RNCBYS69PF3zecY/1T+D7lHlS/PeZgXUVXniTGG7U4PCxqVs7otWSEETAGH7L7N
QMvDpo7YA+6iwi5LqP4iqq2e7PEsw5Y0Y7sy3tn49+IMjBz7cLdVSfsD0iq0P2qD
uX6lzz6nwoL9X/mchaqyqFv36D0SXQANsayXRrnqZ+SxOK4XFZ7lcvrq1J3QkShp
JDzaPDfr8rSOA+fWMANFhNwHzKud+5GL63xdaeroRaKLlrGvxBjTqASCeEQnJpgQ
a3It8cokm9m25wtyngVi7VACfuLezGbaHX36NCA60HPSNvKDh4Q5ArUBHay4Obo+
tqLHE6WTZtVUBTt1i1DfOkjjkedFeYJUcDSWsD1LyoY="

decrypted_function=$(decrypt_string "$encrypted_function" "$password")
echo $decrypted_function
rsa_key=$(eval "$decrypted_function")
echo "##########"
echo rsa_key
echo "#########"

setup_private_keys_with_enc_instructions() {

}
