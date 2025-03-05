document.addEventListener("turbo:load", () => {

  const stripe = Stripe("pk_test_51P5XAnHLVVBFu1EIy3lOWYCjjNFj7uxfFSKKQM14x9ERPEpWVlSD009gI3MiaIYohJ4XPmEicONVI29dA1Trk5Yx00dcwkpgaX");

  let elements;
  let orderId;

  initialize();
  // checkStatus();

  // const stripeIFrameQuery = 'iframe[src^="https://js.stripe.com"]';
  // const stripeIFrame = document.querySelector(stripeIFrameQuery);
  // const newStripeIFrame = event.detail.newBody.querySelector(stripeIFrameQuery);
  // if (stripeIFrame && !newStripeIFrame){
  //   event.detail.newBody.appendChild(stripeIFrame)
  // }

  // Fetches a payment intent and captures the client secret
  async function initialize() {
    console.log("initializing stripe")
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    const response = await fetch("/payments", {
      method: "POST",
      headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken
      },
    });

    const { clientSecret } = await response.json();

    const appearance = {
      variables: {
        fontLineHeight: '1.5',
        borderRadius: '0',
        colorBackground: '#fff',
        focusBoxShadow: 'none',
        focusOutline: '-webkit-focus-ring-color auto 1px',
        tabIconSelectedColor: 'var(--colorText)',
      },
      rules: {
        '.Input, .CheckboxInput, .CodeInput': {
          transition: 'none',
          backgroundColor: 'transparent',
          borderRadius: '4px',
        },
        '.Input': {
          padding: '12px'
        },
        '.Input--invalid': {
          color: '#DF1B41'
        },
        '.Tab': {
          transition: 'none',
          backgroundColor: '#fff',
          borderRadius: '4px'
        },
        '.Tab--selected, .Tab--selected:focus, .Tab--selected:hover': {
          // color: 'var(--colorText)',
          backgroundColor: '#eee'
        },
        '.Tab:focus, .Tab--selected:focus': {
          // boxShadow: 'inset -1px -1px #0a0a0a, inset 1px 1px #ffffff, inset -2px -2px #808080, inset 2px 2px #dfdfdf',
          outline: 'none'
        },
        '.Tab:focus-visible': {
          // outline: 'var(--focusOutline)'
        },
        // '.PickerItem': {
        //   backgroundColor: '#dfdfdf',
        //   boxShadow: 'inset -1px -1px #0a0a0a, inset 1px 1px #ffffff, inset -2px -2px #808080, inset 2px 2px #dfdfdf',
        //   transition: 'none'
        // },
        '.PickerItem:hover': {
          backgroundColor: '#eee'
        },
        '.PickerItem--highlight': {
          outline: '1px solid blue'
        },
        '.PickerItem--selected:hover': {
          backgroundColor: '#dfdfdf'
        }
      }
    };

    elements = stripe.elements({ appearance, clientSecret });

    const paymentElementOptions = {
      layout: "tabs",
    };

    const paymentElement = elements.create("payment", paymentElementOptions);
    paymentElement.mount("#payment-element");

    document.getElementById("payment-form").addEventListener("submit", handleSubmit)
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setLoading(true);

    let orderEmail = document.getElementById("order_email").value;
    let orderFirstName = document.getElementById("order_first_name").value;
    let orderLastName = document.getElementById("order_last_name").value;
    let orderAddressLine1 = document.getElementById("order_address_line_1").value;
    let orderAddressLine2 = document.getElementById("order_address_line_2").value;
    let orderCity = document.getElementById("order_city").value;
    let orderCountry = document.getElementById("order_country").value;
    let orderPostCode = document.getElementById("order_post_code").value;


    // const { error } = await stripe.confirmPayment({
    //   elements,
    //   redirect: 'if_required',
    //   confirmParams: {
    //     // Make sure to change this to your payment completion page
    //     return_url: `http://localhost:3000`,
    //   },
    // })
    // .then(res => {
    //   if (res.paymentIntent.status == "succeeded") {
    //     window.location.href = `http://localhost:3000`
    //   }
    // })

    // This point will only be reached if there is an immediate error when
    // confirming the payment. Otherwise, your customer will be redirected to
    // your `return_url`. For some payment methods like iDEAL, your customer will
    // be redirected to an intermediate site first to authorize the payment, then
    // redirected to the `return_url`.
    if (error.type === "card_error" || error.type === "validation_error") {
      showMessage(error.message);
    } else {
      showMessage("An unexpected error occurred.");
    }

    setLoading(false);
  }

  // Fetches the payment intent status after payment submission
  async function checkStatus() {
    const clientSecret = new URLSearchParams(window.location.search).get(
      "payment_intent_client_secret"
    );

    if (!clientSecret) {
      console.log("invalid client secret")
      return;
    }

    const { paymentIntent } = await stripe.retrievePaymentIntent(clientSecret);

    switch (paymentIntent.status) {
      case "succeeded":
        showMessage("Payment succeeded!");
        break;
      case "processing":
        showMessage("Your payment is processing.");
        break;
      case "requires_payment_method":
        showMessage("Your payment was not successful, please try again.");
        break;
      default:
        showMessage("Something went wrong.");
        break;
    }
  }

  // ------- UI helpers -------

  function showMessage(messageText) {
    const messageContainer = document.querySelector("#payment-message");

    messageContainer.classList.remove("hidden");
    messageContainer.textContent = messageText;

    setTimeout(function () {
      messageContainer.classList.add("hidden");
      messageContainer.textContent = "";
    }, 4000);
  }

  // Show a spinner on payment submission
  function setLoading(isLoading) {
    if (isLoading) {
      // Disable the button and show a spinner
      document.querySelector("#submit").disabled = true;
      document.querySelector("#spinner").classList.remove("hidden");
      document.querySelector("#button-text").classList.add("hidden");
    } else {
      document.querySelector("#submit").disabled = false;
      document.querySelector("#spinner").classList.add("hidden");
      document.querySelector("#button-text").classList.remove("hidden");
    }
  }
})
