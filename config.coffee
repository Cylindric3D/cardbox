params = [
  {
    name: 'card_type',
    type: 'select',
    default: 'Large',
    values: "Large,Small",
    caption: "Type of card",
  },
  {
    name: 'sleeved',
    type: 'checkbox',
    default: false,
    caption: "Are the cards sleeved?",
  },
  {
    name: 'show_cards',
    type: 'checkbox',
    default: false,
    caption: "Show the size of the card stack?",
  },
  {
    name:'stack_size',
    type:'slider',
    default:30,
    max:100,
    min:1,
    step:1,
    caption: "Number of cards",
  }
] 