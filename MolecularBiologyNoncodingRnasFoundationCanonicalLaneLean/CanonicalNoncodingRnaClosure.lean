import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure NoncodingRnaAdmittedObject where
  cellType : Type u
  noncodingRnaPresent : Prop
  functionalAnnotationAvailable : Prop
  conclusion : functionalAnnotationAvailable

structure NoncodingRnaEndgameState where
  object : NoncodingRnaAdmittedObject

def NoncodingRnaWitnessClosed (O : NoncodingRnaAdmittedObject) : Prop :=
  O.functionalAnnotationAvailable

structure AdmissibleClass where
  object : NoncodingRnaAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NoncodingRnaWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NoncodingRnaWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedNoncodingRnaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_noncoding_rna_endgame (A : AdmissibleClass) : ConstrainedNoncodingRnaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse
