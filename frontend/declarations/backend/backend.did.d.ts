import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface AgentInfo {
  'bio' : string,
  'name' : string,
  'email' : string,
  'phone' : string,
}
export interface Property {
  'id' : bigint,
  'bedrooms' : bigint,
  'sqft' : bigint,
  'imageUrl' : string,
  'address' : string,
  'bathrooms' : bigint,
  'price' : bigint,
}
export interface Testimonial {
  'id' : bigint,
  'content' : string,
  'name' : string,
}
export interface _SERVICE {
  'addProperty' : ActorMethod<
    [string, bigint, bigint, bigint, bigint, string],
    bigint
  >,
  'addTestimonial' : ActorMethod<[string, string], bigint>,
  'getAgentInfo' : ActorMethod<[], AgentInfo>,
  'getProperties' : ActorMethod<[], Array<Property>>,
  'getTestimonials' : ActorMethod<[], Array<Testimonial>>,
  'updateAgentInfo' : ActorMethod<[string, string, string, string], undefined>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
