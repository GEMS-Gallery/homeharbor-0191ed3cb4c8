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
  stable var properties : [Property] = [];
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