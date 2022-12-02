using LinearAlgebra, OrdinaryDiffEq, Test, PreallocationTools, ForwardDiff, LabelledArrays,
      RecursiveArrayTools

#Base Array tests
chunk_size = 5
u0_B = ones(5, 5)
dual_B = zeros(ForwardDiff.Dual{ForwardDiff.Tag{typeof(something), Float64}, Float64,
                                chunk_size}, 2, 2)
cache_B = FixedSizeDiffCache(u0_B, chunk_size)
tmp_du_BA = get_tmp(cache_B, u0_B)
tmp_dual_du_BA = get_tmp(cache_B, dual_B)
tmp_du_BN = get_tmp(cache_B, u0_B[1])
tmp_dual_du_BN = get_tmp(cache_B, dual_B[1])
@test size(tmp_du_BA) == size(u0_B)
@test typeof(tmp_du_BA) == typeof(u0_B)
@test eltype(tmp_du_BA) == eltype(u0_B)
@test size(tmp_dual_du_BA) == size(u0_B)
@test_broken typeof(tmp_dual_du_BA) == typeof(dual_B)
@test eltype(tmp_dual_du_BA) == eltype(dual_B)
@test size(tmp_du_BN) == size(u0_B)
@test typeof(tmp_du_BN) == typeof(u0_B)
@test eltype(tmp_du_BN) == eltype(u0_B)
@test size(tmp_dual_du_BN) == size(u0_B)
@test_broken typeof(tmp_dual_du_BN) == typeof(dual_B)
@test eltype(tmp_dual_du_BN) == eltype(dual_B)

#ArrayPartition tests
u0_AP = ArrayPartition(ones(2, 2), ones(3, 3))
dual_a = zeros(ForwardDiff.Dual{ForwardDiff.Tag{typeof(something), Float64}, Float64,
                                chunk_size}, 2, 2)
dual_b = zeros(ForwardDiff.Dual{ForwardDiff.Tag{typeof(something), Float64}, Float64,
                                chunk_size}, 3, 3)
dual_AP = ArrayPartition(dual_a, dual_b)
cache_AP = FixedSizeDiffCache(u0_AP, chunk_size)
tmp_du_APA = get_tmp(cache_AP, u0_AP)
tmp_dual_du_APA = get_tmp(cache_AP, dual_AP)
tmp_du_APN = get_tmp(cache_AP, u0_AP[1])
tmp_dual_du_APN = get_tmp(cache_AP, dual_AP[1])
@test size(tmp_du_APA) == size(u0_AP)
@test typeof(tmp_du_APA) == typeof(u0_AP)
@test eltype(tmp_du_APA) == eltype(u0_AP)
@test size(tmp_dual_du_APA) == size(u0_AP)
@test_broken typeof(tmp_dual_du_APA) == typeof(dual_AP)
@test eltype(tmp_dual_du_APA) == eltype(dual_AP)
@test size(tmp_du_APN) == size(u0_AP)
@test typeof(tmp_du_APN) == typeof(u0_AP)
@test eltype(tmp_du_APN) == eltype(u0_AP)
@test size(tmp_dual_du_APN) == size(u0_AP)
@test_broken typeof(tmp_dual_du_APN) == typeof(dual_AP)
@test eltype(tmp_dual_du_APN) == eltype(dual_AP)
