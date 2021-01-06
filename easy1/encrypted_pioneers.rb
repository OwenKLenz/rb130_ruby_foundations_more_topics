# The following list contains the names of individuals who are pioneers in the 
# field of computing or that have had a significant influence on the field. The 
# names are in an encrypted form, though, using a simple (and incredibly weak) 
# form of encryption called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

# Write a program that deciphers and prints each of these names .

# input: String
# output: String

# Data structures: Strings, hash? or else just using ascii values and modulo

# Considerations: Case sensitivity, skipping spaces

# Algo:
# ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
# NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm

# convert aboves lists to arrays
# zip the two arrays and convert to a hash
# iterate over the characters in each name and (each with object)
#   append the value on the current char's key to the return string
#   include ' ' and '-' in the hash and map to itself

input = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -"
output = "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm -"

DECODER_HASH = input.chars.zip(output.chars).to_h

def decode_rot13(name)
  name.chars.map { |char| DECODER_HASH[char] }.join
end

puts decode_rot13("Nqn Ybirynpr")
puts decode_rot13("Tenpr Ubccre")
puts decode_rot13("Nqryr Tbyqfgvar")
puts decode_rot13("Nyna Ghevat")
puts decode_rot13("Puneyrf Onoontr")
puts decode_rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
puts decode_rot13("Wbua Ngnanfbss")
puts decode_rot13("Ybvf Unvog")
puts decode_rot13("Pynhqr Funaaba")
puts decode_rot13("Fgrir Wbof")
puts decode_rot13("Ovyy Tngrf")
puts decode_rot13("Gvz Orearef-Yrr")
puts decode_rot13("Fgrir Jbmavnx")
puts decode_rot13("Xbaenq Mhfr")
puts decode_rot13("Fve Nagbal Ubner")
puts decode_rot13("Zneiva Zvafxl")
puts decode_rot13("Lhxvuveb Zngfhzbgb")
puts decode_rot13("Unllvz Fybavzfxv")
puts decode_rot13("Tregehqr Oynapu")

# if char is ' ' or '-', use char
# if char > 'm', subtract 13
# if char <= 'm' add 13
puts 

def decode_rot13(name)
  name.chars.each_with_object('') do |char, str|
    str << case
    when char == ' '
      char
    when char == '-'
      char
    when char.downcase <= 'm'
      (char.ord + 13).chr
    when char.downcase > 'm'
      (char.ord - 13).chr
    end
  end
end

puts decode_rot13("Nqn Ybirynpr")
puts decode_rot13("Tenpr Ubccre")
puts decode_rot13("Nqryr Tbyqfgvar")
puts decode_rot13("Nyna Ghevat")
puts decode_rot13("Puneyrf Onoontr")
puts decode_rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
puts decode_rot13("Wbua Ngnanfbss")
puts decode_rot13("Ybvf Unvog")
puts decode_rot13("Pynhqr Funaaba")
puts decode_rot13("Fgrir Wbof")
puts decode_rot13("Ovyy Tngrf")
puts decode_rot13("Gvz Orearef-Yrr")
puts decode_rot13("Fgrir Jbmavnx")
puts decode_rot13("Xbaenq Mhfr")
puts decode_rot13("Fve Nagbal Ubner")
puts decode_rot13("Zneiva Zvafxl")
puts decode_rot13("Lhxvuveb Zngfhzbgb")
puts decode_rot13("Unllvz Fybavzfxv")
puts decode_rot13(decode_rot13("Tregehqr Oynapu"))
