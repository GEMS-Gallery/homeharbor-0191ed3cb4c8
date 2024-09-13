import Nat "mo:base/Nat";

import Array "mo:base/Array";
import Text "mo:base/Text";

actor {
  // Types
  type Property = {
    id: Nat;
    address: Text;
    price: Nat;
    bedrooms: Nat;
    bathrooms: Nat;
    sqft: Nat;
    imageUrl: Text;
  };

  type AgentInfo = {
    name: Text;
    phone: Text;
    email: Text;
    bio: Text;
    imageUrl: Text;
  };

  type Testimonial = {
    id: Nat;
    name: Text;
    content: Text;
  };

  // State
  stable var properties : [Property] = [
    {
      id = 0;
      address = "123 Main St, Anytown, USA";
      price = 350000;
      bedrooms = 3;
      bathrooms = 2;
      sqft = 1800;
      imageUrl = "https://example.com/property1.jpg";
    },
    {
      id = 1;
      address = "456 Oak Ave, Somewhere, USA";
      price = 450000;
      bedrooms = 4;
      bathrooms = 3;
      sqft = 2200;
      imageUrl = "https://example.com/property2.jpg";
    },
    {
      id = 2;
      address = "789 Pine Rd, Elsewhere, USA";
      price = 275000;
      bedrooms = 2;
      bathrooms = 1;
      sqft = 1200;
      imageUrl = "https://example.com/property3.jpg";
    },
    {
      id = 3;
      address = "101 Cedar Ln, Nowhere, USA";
      price = 550000;
      bedrooms = 5;
      bathrooms = 4;
      sqft = 3000;
      imageUrl = "https://example.com/property4.jpg";
    }
  ];
  stable var agentInfo : AgentInfo = {
    name = "John Doe";
    phone = "123-456-7890";
    email = "john@example.com";
    bio = "Experienced real estate agent with 10+ years in the industry.";
    imageUrl = "https://media.licdn.com/dms/image/v2/C5603AQGthJL_DcMSIA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1518390992422?e=1731542400&v=beta&t=X8tUjTEP9pJa61ZhxEj6qPhjLjnGxvaaRt6c4_H65So";
  };
  stable var testimonials : [Testimonial] = [];

  // Property Management
  public func addProperty(address: Text, price: Nat, bedrooms: Nat, bathrooms: Nat, sqft: Nat, imageUrl: Text) : async Nat {
    let id = properties.size();
    let newProperty : Property = {
      id;
      address;
      price;
      bedrooms;
      bathrooms;
      sqft;
      imageUrl;
    };
    properties := Array.append(properties, [newProperty]);
    id
  };

  public query func getProperties() : async [Property] {
    properties
  };

  // Agent Info Management
  public func updateAgentInfo(name: Text, phone: Text, email: Text, bio: Text, imageUrl: Text) : async () {
    agentInfo := {
      name;
      phone;
      email;
      bio;
      imageUrl;
    };
  };

  public query func getAgentInfo() : async AgentInfo {
    agentInfo
  };

  // Testimonial Management
  public func addTestimonial(name: Text, content: Text) : async Nat {
    let id = testimonials.size();
    let newTestimonial : Testimonial = {
      id;
      name;
      content;
    };
    testimonials := Array.append(testimonials, [newTestimonial]);
    id
  };

  public query func getTestimonials() : async [Testimonial] {
    testimonials
  };
}