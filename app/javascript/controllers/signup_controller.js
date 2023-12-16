import { Controller } from '@hotwired/stimulus';

export default class SignupController extends Controller {
    static targets = ["requiredField", "emailMessage", "passwordMessage", "cpasswordMessage", "signupForm"];

    connect()
    {
        console.log("signup-controller-connected");
    }

    submitForm(event) {
        event.preventDefault();
        let valid = true;
        this.requiredFieldTargets.forEach((field) => {
            if (!field.value.trim() || this.fieldValidation(field)) {
                valid = false;
                this.highlightField(field);
            } else {
                this.resetField(field);
            }
        });

        if (valid) {
            this.signupFormTarget.submit();
        }
    }

    validateOnBlur(event)
    {
        var field = event.target;
        if (field.value.trim()) {
            this.resetField(field);
        }
    }

    validatePassword(event)
    {
        var field = event.target;
        var passwordMessage = this.passwordMessageTarget;
        if (this.checkPasswordLength(field.value))
        {
            passwordMessage.classList.add('d-block');
            passwordMessage.classList.remove('d-none');
            this.highlightField(field);
        }
        else
        {
            passwordMessage.classList.add('d-none');
            passwordMessage.classList.remove('d-block');
            this.resetField(field);
        }
    }

    validateConfirmationPassword(event)
    {
        const field = event.target;
        const cpasswordMessage = this.cpasswordMessageTarget;

        if (this.checkPasswordConfirmation())
        {
            console.log('matched');
            cpasswordMessage.classList.add('d-none');
            cpasswordMessage.classList.remove('d-block');
            this.resetField(field);
        }
        else
        {
            console.log('doesnt matched');
            cpasswordMessage.classList.add('d-block');
            cpasswordMessage.classList.remove('d-none');
            this.highlightField(field);

        }
    }

    validateEmail(event)
    {
        const error_message = this.emailMessageTarget;
        const field = event.target;
        if (this.emailRegExp(field.value)) {
            error_message.classList.add("d-none");
            error_message.classList.remove("d-block");
            this.resetField(field);
        }
        else
        {
            error_message.classList.add("d-block");
            error_message.classList.remove("d-none");
            this.highlightField(field);
        }
    }

    fieldValidation(field)
    {
        if (field.id == 'user_email' && !this.emailRegExp(field.value))
        {
            return true;
        }
        else if (field.id == 'user_password' && this.checkPasswordLength(field.value))
        {
            return true;
        }
        else if (field.id == 'user_password_confirmation' && !this.checkPasswordConfirmation())
        {
            return true;
        }
        else {
            return false;
        }

    }

    emailRegExp(email)
    {
        const validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
        return email.match(validRegex);
    }

    checkPasswordLength(password)
    {
        if (password.length < 6) {
            return true;
        }
        return false;
    }

    checkPasswordConfirmation()
    {
        const passwordField = $('#user_password');
        const passwordConfirmationField = $('#user_password_confirmation');
        if (passwordField[0].value == passwordConfirmationField[0].value)
        {
            return true;
        }
        return false;
    }

    highlightField(field) {
        field.classList.add("is-invalid");
    }

    resetField(field) {
        field.classList.remove("is-invalid");
    }
}
