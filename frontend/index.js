import { backend } from 'declarations/backend';

// Fetch and display properties
async function displayProperties() {
    const properties = await backend.getProperties();
    const propertyList = document.getElementById('property-list');
    propertyList.innerHTML = '';

    properties.forEach(property => {
        const propertyCard = document.createElement('div');
        propertyCard.className = 'property-card';
        propertyCard.innerHTML = `
            <img src="${property.imageUrl}" alt="${property.address}">
            <div class="details">
                <h3>${property.address}</h3>
                <p>Price: $${property.price.toLocaleString()}</p>
                <p>${property.bedrooms} bed, ${property.bathrooms} bath, ${property.sqft} sqft</p>
            </div>
        `;
        propertyList.appendChild(propertyCard);
    });
}

// Fetch and display agent info
async function displayAgentInfo() {
    const agentInfo = await backend.getAgentInfo();
    const agentInfoElement = document.getElementById('agent-info');
    agentInfoElement.innerHTML = `
        <h3>${agentInfo.name}</h3>
        <p>Phone: ${agentInfo.phone}</p>
        <p>Email: ${agentInfo.email}</p>
        <p>${agentInfo.bio}</p>
    `;
}

// Fetch and display testimonials
async function displayTestimonials() {
    const testimonials = await backend.getTestimonials();
    const testimonialList = document.getElementById('testimonial-list');
    testimonialList.innerHTML = '';

    testimonials.forEach(testimonial => {
        const testimonialElement = document.createElement('div');
        testimonialElement.className = 'testimonial';
        testimonialElement.innerHTML = `
            <p>"${testimonial.content}"</p>
            <p>- ${testimonial.name}</p>
        `;
        testimonialList.appendChild(testimonialElement);
    });
}

// Handle contact form submission
function setupContactForm() {
    const contactForm = document.getElementById('contact-form');
    contactForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        const formData = new FormData(contactForm);
        const name = formData.get('name');
        const email = formData.get('email');
        const phone = formData.get('phone');
        const message = formData.get('message');

        // Here you would typically send this data to your backend or an email service
        console.log('Form submitted:', { name, email, phone, message });
        alert('Thank you for your message. We will get back to you soon!');
        contactForm.reset();
    });
}

// Initialize the page
async function init() {
    await displayProperties();
    await displayAgentInfo();
    await displayTestimonials();
    setupContactForm();
}

init();