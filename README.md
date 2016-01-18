# alphabet_diamond

Solution to Shokunin programming problem to print a diamond of letters
up to a specific letter of the alphabet.  This code is written in the
programming languae Julia, but pretty much any functional language
would be the same for this code.

To run this script, first install Julia.  On a mac you can do this with homebrew.

	$ brew cask install julia

Then run the script with the following command line:

	$ julia diamond.jl <a single upper- or lower-case letter>

A "go" script is provided for convenience.  If Julia is installed and on your path,

	$ go <a single upper- or lower-case letter>

# Example

	$ go m

                A
               B B
              C   C
             D     D
            E       E
           F         F
          G           G
         H             H
        I               I
       J                 J
      K                   K
     L                     L
    M                       M
     L                     L
      K                   K
       J                 J
        I               I
         H             H
          G           G
           F         F
            E       E
             D     D
              C   C
               B B
                A


