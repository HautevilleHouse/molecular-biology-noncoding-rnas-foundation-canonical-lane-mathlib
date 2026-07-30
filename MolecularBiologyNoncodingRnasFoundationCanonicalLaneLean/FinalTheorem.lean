import canonicalLaneMathlib.AdmissibleClass
import MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.RnaTranscriptomeAnnotation
import MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.NoncodingRnaFamilyClassification
import MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.RegulatoryNetwork
import MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.EvolutionaryConservation
import MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.DiseaseAssociation
import MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.RnaBindingProteins

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure MolecularBiologyAdmissibleClass where
  object : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : MolecularBiologyAdmissibleClass) : Prop :=
  A.object

theorem bridge_from_admissible_class (A : MolecularBiologyAdmissibleClass) : bridgeClosed A :=
  A.object

def gateClosed (A : MolecularBiologyAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MolecularBiologyAdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedMolecularBiologyClosure (A : MolecularBiologyAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_molecular_biology_endgame (A : MolecularBiologyAdmissibleClass) :
    ConstrainedMolecularBiologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse