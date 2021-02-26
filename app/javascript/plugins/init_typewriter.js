import Typewriter from 'typewriter-effect/dist/core';


const initTypewriter = () => {
  var input = document.getElementById('typewriter-input')
   
  var customNodeCreator = function(character) {
    // Add character to input placeholder
    input.placeholder = input.placeholder + character;
   
    // Return null to skip internal adding of dom node
    return null;
  }
   
  var onRemoveNode = function({ character }) {
    if(input.placeholder) {
      // Remove last character from input placeholder
      input.placeholder = input.placeholder.slice(0, -1)
    }
  }
   
  var typewriter = new Typewriter(null, {
    loop: true,
    delay: 75,
    onCreateTextNode: customNodeCreator,
    onRemoveNode: onRemoveNode,
    cursor: 'o',
  });
   
  typewriter
    .typeString('pick a location')
    .pauseFor(1000)
    .deleteAll()
    .typeString('brighton')
    .pauseFor(1000)
    .deleteAll()
    .typeString('marseille')
    .pauseFor(1000)
    .start();
}

export { initTypewriter }
