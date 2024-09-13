export const idlFactory = ({ IDL }) => {
  const AgentInfo = IDL.Record({
    'bio' : IDL.Text,
    'name' : IDL.Text,
    'email' : IDL.Text,
    'imageUrl' : IDL.Text,
    'phone' : IDL.Text,
  });
  const Property = IDL.Record({
    'id' : IDL.Nat,
    'bedrooms' : IDL.Nat,
    'sqft' : IDL.Nat,
    'imageUrl' : IDL.Text,
    'address' : IDL.Text,
    'bathrooms' : IDL.Nat,
    'price' : IDL.Nat,
  });
  const Testimonial = IDL.Record({
    'id' : IDL.Nat,
    'content' : IDL.Text,
    'name' : IDL.Text,
  });
  return IDL.Service({
    'addProperty' : IDL.Func(
        [IDL.Text, IDL.Nat, IDL.Nat, IDL.Nat, IDL.Nat, IDL.Text],
        [IDL.Nat],
        [],
      ),
    'addTestimonial' : IDL.Func([IDL.Text, IDL.Text], [IDL.Nat], []),
    'getAgentInfo' : IDL.Func([], [AgentInfo], ['query']),
    'getProperties' : IDL.Func([], [IDL.Vec(Property)], ['query']),
    'getTestimonials' : IDL.Func([], [IDL.Vec(Testimonial)], ['query']),
    'updateAgentInfo' : IDL.Func(
        [IDL.Text, IDL.Text, IDL.Text, IDL.Text, IDL.Text],
        [],
        [],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
