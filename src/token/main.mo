import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

actor Token {
  var owner : Principal = Principal.fromText("nxs4k-f3whc-dwwyg-hx7wq-fgyue-gvrh4-u3twp-pb2wu-cnzhc-by6hs-gqe");
  var totalSupply : Nat = 1000000000;
  var symbol : Text = "DANG";

  var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

  balances.put(owner, totalSupply);

  public query func balanceOf(who: Principal) : async Nat {

    let balance : Nat = switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    };

    return balance;
  }
}