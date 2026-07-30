import MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NoncodingRnaWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse
