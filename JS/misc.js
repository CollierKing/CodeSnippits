// const node = document.getElementById("root");


//REACT ELEMENTS

import React, { Component } from 'react';                            
import { render } from 'react-dom';
const node = document.getElementById('root');
const root =                                                         
   React.createElement('div', {}, //                                 
     React.createElement('h1', {}, "Hello, world!", //               
       React.createElement('a', {href: 'mailto:mark@ifelse.io'},     
         React.createElement('h1', {}, "React In Action"),
         React.createElement('em', {}, "...and now it really is!")   
       )
     )
   );
render(root, node); //                                               

// REACT COMPONENTS

// Listing 2.4. Using PropTypes and the render method

// ●	1 Import React, React DOM, and prop-types.
import React, { Component } from "react";        //1
import { render } from "react-dom";              //1
import PropTypes from "prop-types";              //1

// ●	2 Create a React class as your Post component. 
//      In this case, you’re only specifying propTypes and a render method.
const node = document.getElementById('root');
class Post extends Component {                   //2
    render() {
        return React.createElement(
            'div',
            {
// ●	3 Create a div element that has a class ‘post’.
                className: 'post'                //3
            },
            React.createElement(
                'h2',
                {
                    className: 'postAuthor',
                    id: this.props.id
                },
// ●	4 What "this" refers to can sometimes be confusing in 
//      JavaScript—here it will refer to the component instance, 
//      not your React class blueprint.
                this.props.user,                 //4
                React.createElement(
                    'span',
                    {
// ●	5 Using className instead of class for the Dom element’s CSS class name
                        className: 'postBody'    //5
                    },
// ●	6 Again, the content prop is the inner content of a span element you’re creating.
                    this.props.content           //6
                )
            )
        );
    }
}

// ●	7 Properties can be optional or required, have a type, 
//      and can even be required to have a certain “shape” 
//      (an object with certain properties, for example).

Post.propTypes = {
    user: PropTypes.string.isRequired,           //7
    content: PropTypes.string.isRequired,        //7
    id: PropTypes.number.isRequired              //7
};

// ●	8 Pass the Post React Class to React.createElement along 
//  with some props to create something. React DOM can render—try 
// changing the data to see how the render for your component output changes.

const App = React.createElement(Post, {
    id: 1,                                       //8
    content: ' said: This is a post!',           //8
    user: 'mark'                                 //8
});

render(App, node);


// NESTED COMPONENTS

// When you use the this.props.children prop, 
// it’s like an outlet for nested data to come through

// Listing 2.5. Adding a nested component
//...
       this.props.user,
       React.createElement(
         "span",
         {
           className: "postBody"
         },
         this.props.content
       ),
// ●	1 Add this.props.children to the Post component so it can render children.

       this.props.children                     //1
//...

// ●	2 Create a Comment component, similarly to how you created a Post component.
class Comment extends Component {              //2
    render() {
        return React.createElement(
            'div',
            {
                className: 'comment'
            },
            React.createElement(
                'h2',
                {
                    className: 'commentAuthor'
                },
                this.props.user,
                React.createElement(
                    'span',
                    {
                        className: 'commentContent'
                    },
                    this.props.content
                )
            )
        );
    }
}
// ●	3 Declare propTypes.
Comment.propTypes = {                          //3
    id: PropTypes.number.isRequired,
    content: PropTypes.string.isRequired,
    user: PropTypes.string.isRequired
};

const App = React.createElement(
    Post,
    {
        id: 1,
        content: ' said: This is a post!',
        user: 'mark'
    },
// ●	4 Nest the Comment component within the Post component.
    React.createElement(Comment, {             //4
        id: 2,
        user: 'bob',
        content: ' commented: wow! how cool!'
    })
);

ReactDOM.render(App, node);


// STATE

// Listing 2.6. Setting initial state
//...

// ●	1 Call super in the class constructor and assign the initial 
//      state object to the instance of the class’s state property—note that 
//      you won’t normally assign state like this except in the constructor 
//      of the component class.

class CreateComment extends Component {
    // If you don’t initialize state and you don’t bind methods, 
    // you don’t need to implement a constructor for your React component
    constructor(props) {
        // super() will calls the constructor of its parent class
        super(props);                              //1
        this.state = {
            content: '',                           //1
            user: ''                               //1
        };
    }
    render() {
        return React.createElement(
            'form',
            {
// ●	2 Create a component as a React class that will have some 
//      input fields for the user—I’ll cover forms in more detail in future chapters.

                                                   //2
                className: 'createComment'
            },
            React.createElement('input', {
                type: 'text',                      //2
                placeholder: 'Your name',
                value: this.state.user
            }),
            React.createElement('input', {
                type: 'text',
                placeholder: 'Thoughts?'           //2
            }),
            React.createElement('input', {
                type: 'submit',
                value: 'Post'
            })
        );
    }
}
CreateComment.propTypes = {
    content: React.PropTypes.string
};
//...
const App = React.createElement(
    Post,
    {
        id: 1,
        content: ' said: This is a post!',
        user: 'mark'
    },
    React.createElement(Comment, {
        id: 2,
        user: 'bob',
        content: ' commented: wow! how cool!'
    }),
// ●	3 Add CreateComment to the App component.
    React.createElement(CreateComment)              //3
);

//EVENT HANDLERS
// https://codesandbox.io/s/x9mxo31pxp

// Here we’re most concerned with two main ones: 
    // when the form input values change, 
    // when the form is submitted. 
// By listening for those events, you can receive and use data to create new comments

class CreateComment extends Component {
    constructor(props) {
        super(props);
        this.state = {
            content: '',
            user: ''
        };
// ●	1 Because components created with classes don’t auto bind component methods, 
//      you need to bind them to this in the constructor.

        this.handleUserChange = this.handleUserChange.bind(this);  //1
        this.handleTextChange = this.handleTextChange.bind(this);  //1
        this.handleSubmit = this.handleSubmit.bind(this);          //1
    }

// ●	2 Assign an event handler to handle changes to the author field—you 
//      get the value of the input element with event.target.value and use 
//      this.setState to update the component’s state.
    handleUserChange(event) {                                      //2
        const val = event.target.value;
        this.setState(() => ({
            user: val
        }));
    }
// ●	3 Create an event handler with similar functionality for the comment content.
    handleTextChange(event) {                                      //3
        const val = event.target.value;
        this.setState(() => ({
            content: val
        }));
    }
// ●	4 Event handler for form submission event    
    handleSubmit(event) {                                          //4
        event.preventDefault();

// ●	5 Reset the input field after submission so the user can submit 
//      further comments.
        this.setState(() => ({                                     //5
            user: '',
            content: ''
        }));
    }
    render() {
        return React.createElement(
            'form',
            {
                className: 'createComment',
                onSubmit: this.handleSubmit
            },
            React.createElement('input', {
                type: 'text',
                placeholder: 'Your name',
                value: this.state.user,
                onChange: this.handleUserChange
            }),
            React.createElement('input', {
                type: 'text',
                placeholder: 'Thoughts?',
                value: this.state.content,
                onChange: this.handleTextChange
            }),
            React.createElement('input', {
                type: 'submit',
                value: 'Post'
            })
        );
    }
}
CreateComment.propTypes = {
    onCommentSubmit: PropTypes.func.isRequired,
    content: PropTypes.string
};


