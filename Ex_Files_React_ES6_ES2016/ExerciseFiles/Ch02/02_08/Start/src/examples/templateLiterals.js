export function templateLiterals () {
  let exclamation = 'yowza'
  let noun = 'jumbo jet'

  //the template literal allows us to easily
  //insert variables into a string

  const madlibs = `"Oh ${exclamation}!" they said.
                   "I've never seen a ${noun} before!" `

  console.log('madlibs = ', madlibs)
  /*
      madlibs = '"Oh yowza!" they said.
        "I've never seen a jumbo jet before!"'
   */
  
}
