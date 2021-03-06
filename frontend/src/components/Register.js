import React, { Component } from 'react';
import swal from 'sweetalert2';

import TextInput from './common/TextInput';
import PasswordInput from './common/PasswordInput';
import { addUser } from '../requests';

export default class Register extends Component {
  constructor(props) {
    super(props);
    this.state = {
      info: {
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phone: '',
        password: '',
        confirmPassword: ''
      }
    };
  }

  handleInput(e, attr) {
    let info = this.state.info;
    info[attr] = e.target.value;
    this.setState({
      info: info
    });
  }

  saveChanges() {
    //TODO: Save the changes in the database
    console.log("Save changes");
    if(this.state.info.firstName &&
       this.state.info.lastName &&
       this.state.info.username &&
       this.state.info.email &&
       this.state.info.phone &&
       this.state.info.password
     ) {
       if(this.state.info.password !== this.state.info.confirmPassword) {
         swal({
           type: 'error',
           title: 'Oops...',
           text: 'The passwords are not equal!',
         });
       } else {
         addUser(this.state.info.username, this.state.info.firstName,
           this.state.info.lastName, this.state.info.email, this.state.info.phone,
           this.state.info.password
         ).then((id) => {
           if(id !== -1) {
             this.props.performLogin(id);
           } else {
             swal({
               type: 'error',
               title: 'Oops...',
               text: 'There was a problem while doing your registration!',
             });
           }
         });
       }
     } else {
       swal({
         type: 'error',
         title: 'Oops...',
         text: 'Please fill the form completely!',
       });
     }
  }

  render() {
    return (
      <div className="row center-align">
        <div className="col s12">
          <h2>Register</h2>
        </div>
        <div className="col s12 l6">
          <TextInput
            name="First Name"
            value={this.state.info.firstName}
            onChange={(e) => {this.handleInput(e, "firstName");} }
          />
        </div>
        <div className="col s12 l6">
          <TextInput
            name="Last Name"
            value={this.state.info.lastName}
            onChange={(e) => {this.handleInput(e, "lastName");} }
          />
        </div>
        <div className="col s12 l6">
          <TextInput
            name="Username"
            value={this.state.info.username}
            onChange={(e) => {this.handleInput(e, "username");} }
          />
        </div>
        <div className="col s12 l6">
          <TextInput
            name="Email"
            value={this.state.info.email}
            onChange={(e) => {this.handleInput(e, "email");} }
          />
        </div>
        <div className="col s12 l6">
          <TextInput
            name="Phone"
            value={this.state.info.phone}
            onChange={(e) => {this.handleInput(e, "phone");} }
          />
        </div>
        <div className="col s12 l6">
          <PasswordInput
            name="Password"
            value={this.state.info.password}
            onChange={(e) => {this.handleInput(e, "password");} }
          />
        </div>
        <div className="col s12 l6">
          <PasswordInput
            name="Confirm Password"
            value={this.state.info.confirmPassword}
            onChange={(e) => {this.handleInput(e, "confirmPassword");} }
          />
        </div>
        <div className="col s12">
          <div className="row">
            <div className="col s12 center-align">
              <button className="waves-effect waves-light btn deep-purple lighten-3" onClick={(e) => {this.saveChanges();}}>
                Register<i className="material-icons left">how_to_reg</i>
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
