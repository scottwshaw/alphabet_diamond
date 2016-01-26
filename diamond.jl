# Load required packages
using JuliaWebAPI
using Compat

function vector_of_offsets(i_max_char::Int)
    vcat(i_max_char:-1:0,1:i_max_char)
end

function vector_of_characters(max_char::Char)
    vcat('A':max_char,max_char-1:-1:'A')
end

function line_to_print(i_max_char::Int)
    (offset::Int, letter::Char) ->
    if(letter == 'A')
        return (" "^offset, 'A')
    else
        return (" "^offset, letter, " "^(2*(i_max_char - offset) - 3), letter)
    end
end

function print_error(message::String)
    println(message)
    println("Usage: julia diamond.jl <single-letter>")
end

function arg_is_valid(arg::String)
    if((length(arg) > 1) ||
       search(ascii('A':'Z'), uppercase(arg)[1]) == 0)
        print_error("please specify a single upper or lower case letter")
        return false
    end
    return true
end

function args_are_valid()
    if(length(ARGS) > 1)
        print_error("too many arguments")
        return false
    elseif(length(ARGS) < 1)
        print_error("please specify the letter at the widest part of the diamond")
        return false
    elseif(!arg_is_valid(ARGS[1]))
        print_error("please specify a single upper or lower case letter")
        return false
    end
    return true
end

function json_alphabet_diamond(input_string::String)
    if(arg_is_valid(input_string))
        let letter_to_print = uppercase(input_string)[1]
            index_of_letter = search(ascii('A':'Z'), letter_to_print)
            lines_to_print = map(line_to_print(index_of_letter),
                                 vector_of_offsets(index_of_letter-1), 
                                 vector_of_characters(letter_to_print))
            line_array = map((l)->string("\"",l...,"\""), lines_to_print)
            return string("[",join(line_array, ","),"]")
        end
    end
end

if(args_are_valid())
    print(json_alphabet_diamond(ARGS[1]))
end

