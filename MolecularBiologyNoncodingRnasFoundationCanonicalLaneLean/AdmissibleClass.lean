import MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : NoncodingRnaAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NoncodingRnaWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse
