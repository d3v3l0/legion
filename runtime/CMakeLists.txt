#------------------------------------------------------------------------------#
# Copyright 2020 Kitware, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#------------------------------------------------------------------------------#

# Install headers
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  FILES_MATCHING PATTERN "*.h"
)
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
  FILES_MATCHING PATTERN "*.inl"
)

# Realm runtime
list(APPEND REALM_SRC
  realm/realm_c.h
  realm/transfer/lowlevel_disk.cc
  realm/transfer/channel.h                 realm/transfer/channel.cc
  realm/transfer/channel_disk.h            realm/transfer/channel_disk.cc
  realm/transfer/transfer.h                realm/transfer/transfer.cc
  realm/transfer/lowlevel_dma.h            realm/transfer/lowlevel_dma.cc
  realm/deppart/byfield.h                  realm/deppart/byfield.cc
  realm/deppart/deppart_config.h
  realm/deppart/image.h                    realm/deppart/image.cc
  realm/deppart/inst_helper.h
  realm/deppart/partitions.h               realm/deppart/partitions.cc
  realm/deppart/preimage.h                 realm/deppart/preimage.cc
  realm/deppart/rectlist.h                 
  realm/deppart/rectlist.inl
  realm/deppart/setops.h                   realm/deppart/setops.cc
  realm/deppart/sparsity_impl.h            realm/deppart/sparsity_impl.cc
  realm/deppart/sparsity_impl.inl
  realm/atomics.h           realm/atomics.inl
  realm/event_impl.h        realm/event_impl.cc
  realm/event_impl.inl
  realm/faults.h            realm/faults.cc
  realm/faults.inl
  realm/idx_impl.h          realm/idx_impl.cc
  realm/inst_impl.h         realm/inst_impl.cc
  realm/inst_layout.h       realm/inst_layout.inl
  realm/inst_layout.cc
  realm/interval_tree.h     realm/interval_tree.inl
  realm/machine_impl.h      realm/machine_impl.cc
  realm/mem_impl.h          realm/mem_impl.cc
  realm/metadata.h          realm/metadata.cc
  realm/module.h            realm/module.cc
  realm/nodeset.h           realm/nodeset.inl      realm/nodeset.cc
  realm/numa/numa_module.h  realm/numa/numa_module.cc
  realm/numa/numasysif.h    realm/numa/numasysif.cc
  realm/operation.h         realm/operation.cc
  realm/operation.inl
  realm/proc_impl.h         realm/proc_impl.cc
  realm/procset/procset_module.h realm/procset/procset_module.cc
  realm/rsrv_impl.h         realm/rsrv_impl.cc
  realm/runtime_impl.h      realm/runtime_impl.cc
  realm/sampling_impl.h     realm/sampling_impl.cc
  realm/subgraph_impl.h     realm/subgraph_impl.cc
  realm/tasks.h             realm/tasks.cc
  realm/threads.h           realm/threads.cc
  realm/threads.inl
)

if(Legion_USE_CUDA)
  list(APPEND REALM_SRC
    realm/cuda/cuda_module.h    realm/cuda/cuda_module.cc
  )
  if(REALM_USE_CUDART_HIJACK)
    list(APPEND REALM_SRC
      realm/cuda/cudart_hijack.h
    )
  endif()
endif()

if(Legion_USE_LLVM)
  list(APPEND REALM_SRC
    realm/llvmjit/llvmjit.h
    realm/llvmjit/llvmjit.inl
    realm/llvmjit/llvmjit_internal.h  realm/llvmjit/llvmjit_internal.cc
    realm/llvmjit/llvmjit_module.h    realm/llvmjit/llvmjit_module.cc
  )
endif()

if(Legion_USE_HDF5)
  list(APPEND REALM_SRC
    realm/hdf5/hdf5_module.h realm/hdf5/hdf5_module.cc
    realm/hdf5/hdf5_internal.h realm/hdf5/hdf5_internal.cc
    realm/hdf5/hdf5_access.h   realm/hdf5/hdf5_access.inl
    realm/hdf5/hdf5_access.cc
  )
endif()

if (REALM_USE_OPENMP)
  list(APPEND REALM_SRC
    realm/openmp/openmp_module.h realm/openmp/openmp_module.cc
    realm/openmp/openmp_internal.h
    realm/openmp/openmp_threadpool.h realm/openmp/openmp_threadpool.cc
    realm/openmp/openmp_threadpool.inl
    realm/openmp/openmp_api.cc
  )
endif()

if (Legion_USE_Python)
  list(APPEND REALM_SRC
    realm/python/python_module.h realm/python/python_module.cc
    realm/python/python_source.h realm/python/python_source.cc
    realm/python/python_source.inl
    realm/python/python_internal.h
  )
endif()

if(REALM_USE_GASNET1)
  list(APPEND REALM_SRC
    realm/gasnet1/gasnet1_module.h
    realm/gasnet1/gasnet1_module.cc
    realm/gasnet1/gasnetmsg.h
    realm/gasnet1/gasnetmsg.cc
  )
endif()

if(REALM_USE_MPI)
  list(APPEND REALM_SRC
    realm/mpi/mpi_module.h
    realm/mpi/mpi_module.cc
    realm/mpi/am_mpi.h
    realm/mpi/am_mpi.cc
  )
endif()

list(APPEND REALM_SRC
  realm.h
  realm/activemsg.h realm/activemsg.cc
  realm/network.h          realm/network.cc
  realm/bytearray.h
  realm/bytearray.inl
  realm/circ_queue.h
  realm/circ_queue.inl
  realm/cmdline.h          realm/cmdline.cc
  realm/cmdline.inl
  realm/codedesc.h         realm/codedesc.cc
  realm/codedesc.inl
  realm/custom_serdez.h
  realm/custom_serdez.inl
  realm/dynamic_table.h
  realm/dynamic_table.inl
  realm/event.h
  realm/id.h
  realm/id.inl
  realm/indexspace.h
  realm/instance.h
  realm/logging.h          realm/logging.cc
  realm/logging.inl
  realm/machine.h
  realm/machine.inl
  realm/memory.h
  realm/mutex.h     realm/mutex.inl     realm/mutex.cc
  realm/pri_queue.h
  realm/pri_queue.inl
  realm/processor.h
  realm/processor.inl
  realm/profiling.h        realm/profiling.cc
  realm/profiling.inl
  realm/realm_config.h
  realm/redop.h
  realm/reservation.h
  realm/reservation.inl
  realm/runtime.h
  realm/sampling.h
  realm/sampling.inl
  realm/serialize.h
  realm/serialize.inl
  realm/subgraph.h
  realm/subgraph.inl
  realm/timers.h           realm/timers.cc
  realm/timers.inl
  realm/utils.h
)

# generate per-dimension object files for deppart stuff
foreach(N1 RANGE 1 ${REALM_MAX_DIM})
  foreach(N2 RANGE 1 ${REALM_MAX_DIM})
    foreach(SRC image preimage byfield)
      # echo -e is not portable, so use perl and try to limit the escape
      #  characters we need to tunnel through cmake
      add_custom_command(
	COMMAND perl -e "$x='#define INST_N1 ${N1}EOL#define INST_N2 ${N2}EOL#include QTrealm/deppart/${SRC}_tmpl.ccQT'; $x=~s/EOL/chr(10)/ge; $x=~s/QT/chr(34)/ge; print $x;" > ${SRC}_${N1}_${N2}.cc
	OUTPUT ${SRC}_${N1}_${N2}.cc
	VERBATIM
	)
      list(APPEND REALM_SRC ${SRC}_${N1}_${N2}.cc)
    endforeach()
  endforeach()
endforeach()

find_package(Threads REQUIRED)
add_library(RealmRuntime ${REALM_SRC})
target_compile_options(RealmRuntime PRIVATE ${CXX_BUILD_WARNING_FLAGS})
if(COMPILER_SUPPORTS_DEFCHECK)
  # use the cxx_defcheck wrapper to make sure realm_defines.h is included
  #  any place it needs to be
  target_compile_options(RealmRuntime PRIVATE --defcheck realm_defines.h)
endif()
if(Legion_USE_LIBDL)
  target_link_libraries(RealmRuntime PRIVATE ${CMAKE_DL_LIBS})
  if(APPLE)
    target_link_libraries(RealmRuntime PRIVATE "-undefined dynamic_lookup")
  endif()
endif()
target_link_libraries(RealmRuntime PRIVATE ${CMAKE_THREAD_LIBS_INIT})
if(UNIX AND NOT APPLE)
  target_link_libraries(RealmRuntime PRIVATE rt)
endif()
set_target_properties(RealmRuntime PROPERTIES POSITION_INDEPENDENT_CODE ON)
set_target_properties(RealmRuntime PROPERTIES SOVERSION ${SOVERSION})

if(Legion_USE_PAPI)
  target_include_directories(RealmRuntime PRIVATE ${PAPI_INCLUDE_DIRS})
  target_link_libraries(RealmRuntime PUBLIC ${PAPI_LIBRARIES})
endif()

if(Legion_USE_HWLOC)
  target_link_libraries(RealmRuntime PRIVATE HWLOC::HWLOC)
endif()

if(REALM_USE_GASNET1)
  target_link_libraries(RealmRuntime PRIVATE GASNet::GASNet)
endif()

if(REALM_USE_MPI)
  target_link_libraries(RealmRuntime PRIVATE MPI::MPI_CXX)
endif()

if(Legion_USE_LLVM)
  if(Legion_LINK_LLVM_LIBS)
    target_link_libraries(RealmRuntime PRIVATE LLVM::LLVM)
  else()
    # even if we dont link, we still need the LLVM include directories
    get_target_property(llvm_incdir LLVM::LLVM INTERFACE_INCLUDE_DIRECTORIES)
    target_include_directories(RealmRuntime PRIVATE ${llvm_incdir})
  endif()
endif()

if(Legion_USE_CUDA)
  if(REALM_USE_CUDART_HIJACK)
    if(Legion_USE_Kokkos)
      # we need kokkos to depend on the hijack without creating a circular
      #  dependency, so put it in an object library - this works only on newer
      #  cmakes, but we already need cmake 3.13 for Kokkos, so this is ok
      add_library(realm_cudarthijack OBJECT
	realm/cuda/cudart_hijack.cc
	realm/cuda/cudart_hijack.h)
      set_target_properties(realm_cudarthijack PROPERTIES POSITION_INDEPENDENT_CODE ON)
      target_include_directories(realm_cudarthijack PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}
	${PROJECT_BINARY_DIR}/runtime
	${CUDA_INCLUDE_DIRS})
      target_link_libraries(RealmRuntime PRIVATE realm_cudarthijack)
      install(TARGETS realm_cudarthijack EXPORT LegionTargets)
    else()
      # without Kokkos interop, we can just add the hijack directly
      target_sources(RealmRuntime PRIVATE realm/cuda/cudart_hijack.cc)
    endif()
    
    # filter anything referring to *cudart* out of the CUDA_LIBRARIES
    #  making sure our changes are visible to the scope above
    # so list(FILTER ...) doesn't exist until cmake 3.6 - do string regex instead
    string(REGEX REPLACE "[^\;]*cudart[^\;]*(\;?)" "" CUDA_LIBRARIES "${CUDA_LIBRARIES}")
    set(CUDA_LIBRARIES ${CUDA_LIBRARIES} PARENT_SCOPE)
  endif()

  target_include_directories(RealmRuntime PRIVATE ${CUDA_INCLUDE_DIRS})
  target_link_libraries(RealmRuntime PRIVATE ${CUDA_CUDA_LIBRARY})
  # for backwards compatibility in applications
  target_compile_definitions(RealmRuntime INTERFACE USE_CUDA)
endif()

# fetches a specified property list from the target, performs per-element
#  replacement of the items in the list, and then write the list back to
#  the target's property
# importantly, this works on properies of imported targets...
macro(edit_target_property tgtname propname pattern replacement)
  get_property(has_prop TARGET ${tgtname} PROPERTY ${propname} SET)
  if(has_prop)
    get_property(prop_list TARGET ${tgtname} PROPERTY ${propname})
    if(NOT "${replacement}" STREQUAL "")
      list(TRANSFORM prop_list REPLACE ${pattern} ${replacement})
    else()
      list(FILTER prop_list EXCLUDE REGEX ${pattern})
    endif()
    set_property(TARGET ${tgtname} PROPERTY ${propname} "${prop_list}")
  endif()
endmacro()

if(Legion_USE_Kokkos)
  # realm/kokkos_interop.cc needs to be compiled like a kokkos application, so
  #  get kokkos' compile options, include dirs - do this by creating a subtarget
  #  that can import Kokkos::kokkoscore

  # unfortunately, building like Kokkos means using Kokkos' choice of C++
  #  compiler, and cmake really doesn't want to make that easy - we have to
  #  do the build as a custom command and construct the entire command line
  #  ourselves

  # start with compile options exported by kokkos, but we have to parse the
  #  generator expressions ourselves...
  get_property(kokkos_compile_options TARGET Kokkos::kokkoscore PROPERTY INTERFACE_COMPILE_OPTIONS)
  string(REGEX REPLACE "\\$<\\$<COMPILE_LANGUAGE:CXX>:([^<>]*)>" \\1 kokkos_compile_options "${kokkos_compile_options}")
  string(REGEX REPLACE "\\$<\\$<COMPILE_LANGUAGE:.+>:([^<>]*)>" "" kokkos_compile_options "${kokkos_compile_options}")

  # also do kokkos' compile features (or at least the one we understand)
  get_property(kokkos_compile_features TARGET Kokkos::kokkoscore PROPERTY INTERFACE_COMPILE_FEATURES)
  foreach(feature IN LISTS kokkos_compile_features)
    if(feature MATCHES "cxx_std_([0-9]+)")
      list(APPEND kokkos_compile_options "-std=c++${CMAKE_MATCH_1}")
    else()
      message(WARNING "unrecognized Kokkos compile feature: ${feature}")
    endif()
  endforeach()

  # now add on our own cxx flags, dealing with the whole strings vs lists thing
  set(cxx_flags_as_list ${CMAKE_CXX_FLAGS} -fPIC ${CXX_BUILD_WARNING_FLAGS})
  if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    string(APPEND cxx_flags_as_list " ${CMAKE_CXX_FLAGS_DEBUG}")
  endif()
  if(CMAKE_BUILD_TYPE STREQUAL "Release")
    string(APPEND cxx_flags_as_list " ${CMAKE_CXX_FLAGS_RELEASE}")
  endif()
  separate_arguments(cxx_flags_as_list)
  list(APPEND kokkos_compile_options ${cxx_flags_as_list})

  # next up is include directories...
  get_property(kokkos_include_dirs
               TARGET Kokkos::kokkoscore
               PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
  list(TRANSFORM kokkos_include_dirs PREPEND "-I")
  list(APPEND kokkos_compile_options ${kokkos_include_dirs}
                                     "-I${CMAKE_CURRENT_SOURCE_DIR}"
                                     "-I${PROJECT_BINARY_DIR}/runtime")

  # and then finally, tell clang (if it is clang) where to find CUDA
  if(Legion_USE_CUDA AND (KOKKOS_CXX_COMPILER MATCHES ".*clang.*"))
    list(APPEND kokkos_compile_options "--cuda-path=${CUDA_TOOLKIT_ROOT_DIR}")
  endif()

  # now define our custom build command
  add_custom_command(OUTPUT realm_kokkos_interop.cc.o
                     COMMAND ${KOKKOS_CXX_COMPILER}
                             ${kokkos_compile_options}
                             -c ${CMAKE_CURRENT_SOURCE_DIR}/realm/kokkos_interop.cc
                             -o ${CMAKE_CURRENT_BINARY_DIR}/realm_kokkos_interop.cc.o
                     IMPLICIT_DEPENDS CXX ${CMAKE_CURRENT_SOURCE_DIR}/realm/kokkos_interop.cc
                     VERBATIM)

  # add our object file to the realm library
  target_sources(RealmRuntime PRIVATE
                 ${CMAKE_CURRENT_BINARY_DIR}/realm_kokkos_interop.cc.o)

  # and add kokkos libraries to our exported library requirements
  set_property(TARGET RealmRuntime APPEND
    PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:Kokkos::kokkoscore>")
  
  # if Kokkos' CUDA target is enabled, and we're performing runtime hijack,
  #  rewrite Kokkos' cudart dependency to be on Realm instead
  if(Kokkos_ENABLE_CUDA AND Legion_HIJACK_CUDART)
    edit_target_property(Kokkos::CUDA INTERFACE_LINK_LIBRARIES .*cudart.* realm_cudarthijack)
  endif()

  # similarly, if Kokkos' OpenMP target is enabled but we're using Realm's
  #  OpenMP runtime implementation, remove anything mentioning openmp from
  #  the exported link options (don't mess with compile options though)
  if(Kokkos_ENABLE_OPENMP AND Legion_USE_OpenMP)
    edit_target_property(Kokkos::kokkoscore INTERFACE_LINK_OPTIONS .*openmp.* "")
    edit_target_property(Kokkos::kokkoscontainers INTERFACE_LINK_OPTIONS .*openmp.* "")
  endif()
endif()

if(Legion_USE_HDF5)
  target_include_directories(RealmRuntime PRIVATE ${HDF5_INCLUDE_DIRS})
  target_link_libraries(RealmRuntime PRIVATE ${HDF5_LIBRARIES})
  # for backwards compatibility in applications
  target_compile_definitions(RealmRuntime INTERFACE USE_HDF)
endif()

set_target_properties(RealmRuntime PROPERTIES OUTPUT_NAME "realm${INSTALL_SUFFIX}")

target_include_directories(RealmRuntime
  INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}

  # Include paths for generated header files.
  INTERFACE
    $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/runtime>
  PRIVATE
    ${PROJECT_BINARY_DIR}/runtime
)

install(TARGETS RealmRuntime EXPORT LegionTargets
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Mapper objects
list(APPEND MAPPER_SRC
  mappers/debug_mapper.h       mappers/debug_mapper.cc
  mappers/default_mapper.h     mappers/default_mapper.cc
  mappers/mapping_utilities.h  mappers/mapping_utilities.cc
  mappers/replay_mapper.h      mappers/replay_mapper.cc
  mappers/shim_mapper.h        mappers/shim_mapper.cc
  mappers/test_mapper.h        mappers/test_mapper.cc
  mappers/null_mapper.h        mappers/null_mapper.cc
)

# Legion runtime
list(APPEND LEGION_SRC
  legion.h
  legion/accessor.h
  legion/arrays.h
  legion/bitmask.h
  legion/field_tree.h
  legion/garbage_collection.h             legion/garbage_collection.cc
  legion/interval_tree.h                 
  legion/legion_allocation.h             
  legion/legion_analysis.h                legion/legion_analysis.cc
  legion/legion_c.h                       legion/legion_c.cc
  legion/legion_config.h                 
  legion/legion_constraint.h              legion/legion_constraint.cc
  legion/legion_context.h                 legion/legion_context.cc
  legion/legion_c_util.h                 
  legion/legion.cc
  legion/legion.inl                      
  legion/legion_domain.h
  legion/legion_domain.inl
  legion/legion_instances.h               legion/legion_instances.cc
  legion/legion_mapping.h                 legion/legion_mapping.cc
  legion/legion_ops.h                     legion/legion_ops.cc
  legion/legion_profiling.h               legion/legion_profiling.cc
  legion/legion_profiling_serializer.h    legion/legion_profiling_serializer.cc
  legion/legion_spy.h                     legion/legion_spy.cc
  legion/legion_tasks.h                   legion/legion_tasks.cc
  legion/legion_trace.h                   legion/legion_trace.cc
  legion/legion_types.h                 
  legion/legion_utilities.h             
  legion/legion_views.h                   legion/legion_views.cc
  legion/legion_redop.h                   legion/legion_redop.cc
  legion/mapper_manager.h                 legion/mapper_manager.cc
  legion/rectangle_set.h                
  legion/region_tree.h                    legion/region_tree.cc
  legion/runtime.h                        legion/runtime.cc
)

if(Legion_REDOP_HALF)
  list(APPEND LEGION_SRC mathtypes/half.h)
endif()

if(Legion_REDOP_COMPLEX)
  list(APPEND LEGION_SRC mathtypes/complex.h)
endif()

if(Legion_GPU_REDUCTIONS)
  list(APPEND LEGION_CUDA_SRC
    legion/legion_redop.cu
  )
endif()

# generate per-dimension object files for deppart stuff
foreach(N1 RANGE 1 ${LEGION_MAX_DIM})
  # echo -e is not portable, so use perl and try to limit the escape
  #  characters we need to tunnel through cmake
  add_custom_command(
    COMMAND perl -e "$x='#define INST_N1 ${N1}EOL#include QTlegion/region_tree_tmpl.ccQT'; $x=~s/EOL/chr(10)/ge; $x=~s/QT/chr(34)/ge; print $x;" > region_tree_${N1}.cc
    OUTPUT region_tree_${N1}.cc
    VERBATIM
    )
  list(APPEND LEGION_SRC region_tree_${N1}.cc)
  
  foreach(N2 RANGE 1 ${LEGION_MAX_DIM})
    add_custom_command(
      COMMAND perl -e "$x='#define INST_N1 ${N1}EOL#define INST_N2 ${N2}EOL#include QTlegion/region_tree_tmpl.ccQT'; $x=~s/EOL/chr(10)/ge; $x=~s/QT/chr(34)/ge; print $x;" > region_tree_${N1}_${N2}.cc
      OUTPUT region_tree_${N1}_${N2}.cc
      VERBATIM
      )
    list(APPEND LEGION_SRC region_tree_${N1}_${N2}.cc)
  endforeach()
endforeach()
              
# Legion Fortran
if(Legion_USE_Fortran)
  list(APPEND LEGION_FORTRAN_SRC
    legion/legion_f_types.f90
    legion/legion_f_c_interface.f90
    legion/legion_f.f90              
  )
endif()               

add_library(LegionRuntime ${MAPPER_SRC} ${LEGION_SRC} ${LEGION_FORTRAN_SRC})
# do we have any cuda source files in Legion itself?
if(LEGION_CUDA_SRC)
  if("${Legion_CUDA_ARCH}" STREQUAL "")
    set(CUDA_GENCODE "")
  else()
    string(REPLACE "," ";" CUDA_GENCODE "${Legion_CUDA_ARCH}")
    string(REGEX REPLACE "([0-9]+)" "-gencode arch=compute_\\1,code=sm_\\1" CUDA_GENCODE "${CUDA_GENCODE}")
  endif()
  # starting with NVCC 10.2, we can error out on all warnings
  if(Legion_BUILD_WARN_AS_ERROR AND CUDA_VERSION VERSION_GREATER "10.1")
    set(CUDA_WARNINGS "-Werror all-warnings")
  else()
    set(CUDA_WARNINGS "")
  endif()
  cuda_compile(LEGION_CUDA_OBJS ${LEGION_CUDA_SRC} OPTIONS
    -Xcudafe "--diag_suppress=boolean_controlling_expr_is_constant"
    ${CUDA_WARNINGS}
    ${CUDA_GENCODE}
    -I ${CMAKE_CURRENT_SOURCE_DIR}
    -I ${PROJECT_BINARY_DIR}/runtime
    -Xcompiler -fPIC
    DEBUG -g
    RELEASE -O2
    RELWITHDEBINFO -g -O2)
  target_sources(LegionRuntime PRIVATE ${LEGION_CUDA_OBJS})
  target_link_libraries(LegionRuntime PUBLIC ${CUDA_LIBRARIES})
endif()
target_link_libraries(LegionRuntime PUBLIC RealmRuntime)
if(Legion_USE_ZLIB)
  target_link_libraries(LegionRuntime PRIVATE ZLIB::ZLIB)
endif()
set_target_properties(LegionRuntime PROPERTIES POSITION_INDEPENDENT_CODE ON)
set_target_properties(LegionRuntime PROPERTIES OUTPUT_NAME "legion${INSTALL_SUFFIX}")
set_target_properties(LegionRuntime PROPERTIES SOVERSION ${SOVERSION})
target_compile_options(LegionRuntime PRIVATE ${CXX_BUILD_WARNING_FLAGS})
if(COMPILER_SUPPORTS_DEFCHECK)
  # use the cxx_defcheck wrapper to make sure legion_defines.h is included
  #  any place it needs to be
  target_compile_options(LegionRuntime PRIVATE --defcheck legion_defines.h)
endif()

target_include_directories(LegionRuntime
  INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/mappers>
    $<INSTALL_INTERFACE:include>
    $<INSTALL_INTERFACE:include/mappers>
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}

  # Include paths for generated header files.
  INTERFACE
    $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/runtime>
  PRIVATE
    ${PROJECT_BINARY_DIR}/runtime
)

install(TARGETS LegionRuntime EXPORT LegionTargets
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

add_library(Legion INTERFACE)
set_target_properties(Legion PROPERTIES
  INTERFACE_LINK_LIBRARIES LegionRuntime
)
add_library(Realm INTERFACE)
set_target_properties(Realm PROPERTIES
  INTERFACE_LINK_LIBRARIES RealmRuntime
)
install(TARGETS Legion Realm EXPORT LegionTargets)
