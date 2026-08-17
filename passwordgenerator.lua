-- LUA PASSWORD GENERATOR
-- special character table

special_chars = {}

for i = 32, 47 do -- adds special characters to table (U+0020-U+002F)
    table.insert(special_chars, string.char(i))
end

for i = 58, 64 do -- adds special characters to table (U+003A-U+0040)
    table.insert(special_chars, string.char(i))
end

for i = 91, 96 do -- adds special characters to table (U+005B-U+0060)
    table.insert(special_chars, string.char(i))
end

for i = 123, 126 do -- adds special characters to table (U+007B-U+007E)
    table.insert(special_chars, string.char(i))
end


-- numbers table

nums = {}

for i = 48, 57 do -- adds numbers to table (U+0030-U+0039)
    table.insert(nums, string.char(i))
end


-- letters table

letters = {}

for i = 65, 90 do -- adds uppercase letters to table (U+0041-U+005A)
    table.insert(letters, string.char(i))
end

for i = 97, 122 do -- adds lowercase letters to table (U+0061-U+007A)
    table.insert(letters, string.char(i))
end

--password generation function

function passwordGen(standard_length)
    local password = {}

    for i = 0, standard_length, 1 do
        if math.random(1,3) == 3 then
            table.insert(password, special_chars[math.random(1, #special_chars)])
        elseif math.random(1,3) == 2 then
            table.insert(password, nums[math.random(1, #nums)])
        else  
            table.insert(password, letters[math.random(1, #letters)])
        end
    end

    return print(table.concat(password, ""))
end

-- title and command line input

print("Lua Password Generator")

print("\nWhich standard length do you want? NIST (15-64 Characters) or OWASP (13-15)?")
print("\nEnter Standard (NIST/OWASP)")

standard = io.read():upper()

function enter_standard()
    if standard == "NIST" then --Checks standard
        passwordGen(math.random(15,64)) --Calls function
    elseif standard == "OWASP" then
        passwordGen(math.random(13,15))
    else 
        print("\nRe-Enter")
        standard = io.read():upper()
        enter_standard()
    end
end

enter_standard()
