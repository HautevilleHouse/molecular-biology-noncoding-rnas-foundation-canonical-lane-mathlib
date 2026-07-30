import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure EvolutionaryConservationPackage where
  sequenceConservation : Prop
  structuralConservation : Prop
  functionalConservation : Prop
  phylogeneticDistribution : Prop

structure EvolutionaryConservationEvidence (E : EvolutionaryConservationPackage) where
  sequenceConservationClosed : E.sequenceConservation
  structuralConservationClosed : E.structuralConservation
  functionalConservationClosed : E.functionalConservation
  phylogeneticDistributionClosed : E.phylogeneticDistribution

def EvolutionaryConservationClosed (E : EvolutionaryConservationPackage) : Prop :=
  E.sequenceConservation ∧ E.structuralConservation ∧
  E.functionalConservation ∧ E.phylogeneticDistribution

theorem evolutionary_conservation_closed_from_evidence
    (E : EvolutionaryConservationPackage) (Ev : EvolutionaryConservationEvidence E) :
    EvolutionaryConservationClosed E := by
  exact And.intro Ev.sequenceConservationClosed
    (And.intro Ev.structuralConservationClosed
      (And.intro Ev.functionalConservationClosed Ev.phylogeneticDistributionClosed))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse