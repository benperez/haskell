{-
   Kubernetes

   No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

   OpenAPI spec version: 2.0
   Kubernetes API version: v1.9.2
   Generated by Swagger Codegen (https://github.com/swagger-api/swagger-codegen.git)
-}

{-|
Module : Kubernetes.API.EventsV1beta1
-}

{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing -fno-warn-unused-binds -fno-warn-unused-imports #-}

module Kubernetes.API.EventsV1beta1 where

import Kubernetes.Core
import Kubernetes.MimeTypes
import Kubernetes.Model as M

import qualified Data.Aeson as A
import qualified Data.ByteString as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.Data as P (Typeable, TypeRep, typeOf, typeRep)
import qualified Data.Foldable as P
import qualified Data.Map as Map
import qualified Data.Maybe as P
import qualified Data.Proxy as P (Proxy(..))
import qualified Data.Set as Set
import qualified Data.String as P
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Encoding as TL
import qualified Data.Time as TI
import qualified Network.HTTP.Client.MultipartFormData as NH
import qualified Network.HTTP.Media as ME
import qualified Network.HTTP.Types as NH
import qualified Web.FormUrlEncoded as WH
import qualified Web.HttpApiData as WH

import Data.Text (Text)
import GHC.Base ((<|>))

import Prelude ((==),(/=),($), (.),(<$>),(<*>),(>>=),Maybe(..),Bool(..),Char,Double,FilePath,Float,Int,Integer,String,fmap,undefined,mempty,maybe,pure,Monad,Applicative,Functor)
import qualified Prelude as P

-- * Operations


-- ** EventsV1beta1

-- *** createNamespacedEvent

-- | @POST \/apis\/events.k8s.io\/v1beta1\/namespaces\/{namespace}\/events@
-- 
-- create an Event
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
createNamespacedEvent 
  :: (Consumes CreateNamespacedEvent contentType, MimeRender contentType V1beta1Event)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> V1beta1Event -- ^ "body"
  -> KubernetesRequest CreateNamespacedEvent contentType V1beta1Event accept
createNamespacedEvent _  _ (Namespace namespace) body =
  _mkRequest "POST" ["/apis/events.k8s.io/v1beta1/namespaces/",toPath namespace,"/events"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data CreateNamespacedEvent 
instance HasBodyParam CreateNamespacedEvent V1beta1Event 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam CreateNamespacedEvent Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes CreateNamespacedEvent mtype

-- | @application/json@
instance Produces CreateNamespacedEvent MimeJSON
-- | @application/yaml@
instance Produces CreateNamespacedEvent MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces CreateNamespacedEvent MimeVndKubernetesProtobuf


-- *** deleteCollectionNamespacedEvent

-- | @DELETE \/apis\/events.k8s.io\/v1beta1\/namespaces\/{namespace}\/events@
-- 
-- delete collection of Event
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteCollectionNamespacedEvent 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest DeleteCollectionNamespacedEvent MimeNoContent V1Status accept
deleteCollectionNamespacedEvent  _ (Namespace namespace) =
  _mkRequest "DELETE" ["/apis/events.k8s.io/v1beta1/namespaces/",toPath namespace,"/events"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data DeleteCollectionNamespacedEvent  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteCollectionNamespacedEvent Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam DeleteCollectionNamespacedEvent Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam DeleteCollectionNamespacedEvent FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam DeleteCollectionNamespacedEvent IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam DeleteCollectionNamespacedEvent LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam DeleteCollectionNamespacedEvent Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam DeleteCollectionNamespacedEvent ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam DeleteCollectionNamespacedEvent TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam DeleteCollectionNamespacedEvent Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes DeleteCollectionNamespacedEvent mtype

-- | @application/json@
instance Produces DeleteCollectionNamespacedEvent MimeJSON
-- | @application/yaml@
instance Produces DeleteCollectionNamespacedEvent MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteCollectionNamespacedEvent MimeVndKubernetesProtobuf


-- *** deleteNamespacedEvent

-- | @DELETE \/apis\/events.k8s.io\/v1beta1\/namespaces\/{namespace}\/events\/{name}@
-- 
-- delete an Event
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
deleteNamespacedEvent 
  :: (Consumes DeleteNamespacedEvent contentType, MimeRender contentType V1DeleteOptions)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the Event
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> V1DeleteOptions -- ^ "body"
  -> KubernetesRequest DeleteNamespacedEvent contentType V1Status accept
deleteNamespacedEvent _  _ (Name name) (Namespace namespace) body =
  _mkRequest "DELETE" ["/apis/events.k8s.io/v1beta1/namespaces/",toPath namespace,"/events/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data DeleteNamespacedEvent 
instance HasBodyParam DeleteNamespacedEvent V1DeleteOptions 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam DeleteNamespacedEvent Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "gracePeriodSeconds" - The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
instance HasOptionalParam DeleteNamespacedEvent GracePeriodSeconds where
  applyOptionalParam req (GracePeriodSeconds xs) =
    req `setQuery` toQuery ("gracePeriodSeconds", Just xs)

-- | /Optional Param/ "orphanDependents" - Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the \"orphan\" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
instance HasOptionalParam DeleteNamespacedEvent OrphanDependents where
  applyOptionalParam req (OrphanDependents xs) =
    req `setQuery` toQuery ("orphanDependents", Just xs)

-- | /Optional Param/ "propagationPolicy" - Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
instance HasOptionalParam DeleteNamespacedEvent PropagationPolicy where
  applyOptionalParam req (PropagationPolicy xs) =
    req `setQuery` toQuery ("propagationPolicy", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes DeleteNamespacedEvent mtype

-- | @application/json@
instance Produces DeleteNamespacedEvent MimeJSON
-- | @application/yaml@
instance Produces DeleteNamespacedEvent MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces DeleteNamespacedEvent MimeVndKubernetesProtobuf


-- *** getAPIResources

-- | @GET \/apis\/events.k8s.io\/v1beta1\/@
-- 
-- get available resources
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
getAPIResources 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest GetAPIResources MimeNoContent V1APIResourceList accept
getAPIResources  _ =
  _mkRequest "GET" ["/apis/events.k8s.io/v1beta1/"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data GetAPIResources  

-- | @application/json@
instance Consumes GetAPIResources MimeJSON
-- | @application/yaml@
instance Consumes GetAPIResources MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Consumes GetAPIResources MimeVndKubernetesProtobuf

-- | @application/json@
instance Produces GetAPIResources MimeJSON
-- | @application/yaml@
instance Produces GetAPIResources MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces GetAPIResources MimeVndKubernetesProtobuf


-- *** listEventForAllNamespaces

-- | @GET \/apis\/events.k8s.io\/v1beta1\/events@
-- 
-- list or watch objects of kind Event
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listEventForAllNamespaces 
  :: Accept accept -- ^ request accept ('MimeType')
  -> KubernetesRequest ListEventForAllNamespaces MimeNoContent V1beta1EventList accept
listEventForAllNamespaces  _ =
  _mkRequest "GET" ["/apis/events.k8s.io/v1beta1/events"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListEventForAllNamespaces  

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListEventForAllNamespaces Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListEventForAllNamespaces FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam ListEventForAllNamespaces IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListEventForAllNamespaces LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListEventForAllNamespaces Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListEventForAllNamespaces Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListEventForAllNamespaces ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam ListEventForAllNamespaces TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListEventForAllNamespaces Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes ListEventForAllNamespaces mtype

-- | @application/json@
instance Produces ListEventForAllNamespaces MimeJSON
-- | @application/yaml@
instance Produces ListEventForAllNamespaces MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListEventForAllNamespaces MimeVndKubernetesProtobuf
-- | @application/json;stream=watch@
instance Produces ListEventForAllNamespaces MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListEventForAllNamespaces MimeVndKubernetesProtobufstreamwatch


-- *** listNamespacedEvent

-- | @GET \/apis\/events.k8s.io\/v1beta1\/namespaces\/{namespace}\/events@
-- 
-- list or watch objects of kind Event
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
listNamespacedEvent 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ListNamespacedEvent MimeNoContent V1beta1EventList accept
listNamespacedEvent  _ (Namespace namespace) =
  _mkRequest "GET" ["/apis/events.k8s.io/v1beta1/namespaces/",toPath namespace,"/events"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ListNamespacedEvent  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ListNamespacedEvent Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "continue" - The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server the server will respond with a 410 ResourceExpired error indicating the client must restart their list without the continue field. This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.
instance HasOptionalParam ListNamespacedEvent Continue where
  applyOptionalParam req (Continue xs) =
    req `setQuery` toQuery ("continue", Just xs)

-- | /Optional Param/ "fieldSelector" - A selector to restrict the list of returned objects by their fields. Defaults to everything.
instance HasOptionalParam ListNamespacedEvent FieldSelector where
  applyOptionalParam req (FieldSelector xs) =
    req `setQuery` toQuery ("fieldSelector", Just xs)

-- | /Optional Param/ "includeUninitialized" - If true, partially initialized resources are included in the response.
instance HasOptionalParam ListNamespacedEvent IncludeUninitialized where
  applyOptionalParam req (IncludeUninitialized xs) =
    req `setQuery` toQuery ("includeUninitialized", Just xs)

-- | /Optional Param/ "labelSelector" - A selector to restrict the list of returned objects by their labels. Defaults to everything.
instance HasOptionalParam ListNamespacedEvent LabelSelector where
  applyOptionalParam req (LabelSelector xs) =
    req `setQuery` toQuery ("labelSelector", Just xs)

-- | /Optional Param/ "limit" - limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.
instance HasOptionalParam ListNamespacedEvent Limit where
  applyOptionalParam req (Limit xs) =
    req `setQuery` toQuery ("limit", Just xs)

-- | /Optional Param/ "resourceVersion" - When specified with a watch call, shows changes that occur after that particular version of a resource. Defaults to changes from the beginning of history. When specified for list: - if unset, then the result is returned from remote storage based on quorum-read flag; - if it's 0, then we simply return what we currently have in cache, no guarantee; - if set to non zero, then the result is at least as fresh as given rv.
instance HasOptionalParam ListNamespacedEvent ResourceVersion where
  applyOptionalParam req (ResourceVersion xs) =
    req `setQuery` toQuery ("resourceVersion", Just xs)

-- | /Optional Param/ "timeoutSeconds" - Timeout for the list/watch call.
instance HasOptionalParam ListNamespacedEvent TimeoutSeconds where
  applyOptionalParam req (TimeoutSeconds xs) =
    req `setQuery` toQuery ("timeoutSeconds", Just xs)

-- | /Optional Param/ "watch" - Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.
instance HasOptionalParam ListNamespacedEvent Watch where
  applyOptionalParam req (Watch xs) =
    req `setQuery` toQuery ("watch", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes ListNamespacedEvent mtype

-- | @application/json@
instance Produces ListNamespacedEvent MimeJSON
-- | @application/yaml@
instance Produces ListNamespacedEvent MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces ListNamespacedEvent MimeVndKubernetesProtobuf
-- | @application/json;stream=watch@
instance Produces ListNamespacedEvent MimeJsonstreamwatch
-- | @application/vnd.kubernetes.protobuf;stream=watch@
instance Produces ListNamespacedEvent MimeVndKubernetesProtobufstreamwatch


-- *** patchNamespacedEvent

-- | @PATCH \/apis\/events.k8s.io\/v1beta1\/namespaces\/{namespace}\/events\/{name}@
-- 
-- partially update the specified Event
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
patchNamespacedEvent 
  :: (Consumes PatchNamespacedEvent contentType, MimeRender contentType A.Value)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the Event
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> A.Value -- ^ "body"
  -> KubernetesRequest PatchNamespacedEvent contentType V1beta1Event accept
patchNamespacedEvent _  _ (Name name) (Namespace namespace) body =
  _mkRequest "PATCH" ["/apis/events.k8s.io/v1beta1/namespaces/",toPath namespace,"/events/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data PatchNamespacedEvent 
instance HasBodyParam PatchNamespacedEvent A.Value 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam PatchNamespacedEvent Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @application/json-patch+json@
instance Consumes PatchNamespacedEvent MimeJsonPatchjson
-- | @application/merge-patch+json@
instance Consumes PatchNamespacedEvent MimeMergePatchjson
-- | @application/strategic-merge-patch+json@
instance Consumes PatchNamespacedEvent MimeStrategicMergePatchjson

-- | @application/json@
instance Produces PatchNamespacedEvent MimeJSON
-- | @application/yaml@
instance Produces PatchNamespacedEvent MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces PatchNamespacedEvent MimeVndKubernetesProtobuf


-- *** readNamespacedEvent

-- | @GET \/apis\/events.k8s.io\/v1beta1\/namespaces\/{namespace}\/events\/{name}@
-- 
-- read the specified Event
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
readNamespacedEvent 
  :: Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the Event
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> KubernetesRequest ReadNamespacedEvent MimeNoContent V1beta1Event accept
readNamespacedEvent  _ (Name name) (Namespace namespace) =
  _mkRequest "GET" ["/apis/events.k8s.io/v1beta1/namespaces/",toPath namespace,"/events/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)

data ReadNamespacedEvent  

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReadNamespacedEvent Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | /Optional Param/ "exact" - Should the export be exact.  Exact export maintains cluster-specific fields like 'Namespace'.
instance HasOptionalParam ReadNamespacedEvent Exact where
  applyOptionalParam req (Exact xs) =
    req `setQuery` toQuery ("exact", Just xs)

-- | /Optional Param/ "export" - Should this value be exported.  Export strips fields that a user can not specify.
instance HasOptionalParam ReadNamespacedEvent Export where
  applyOptionalParam req (Export xs) =
    req `setQuery` toQuery ("export", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes ReadNamespacedEvent mtype

-- | @application/json@
instance Produces ReadNamespacedEvent MimeJSON
-- | @application/yaml@
instance Produces ReadNamespacedEvent MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReadNamespacedEvent MimeVndKubernetesProtobuf


-- *** replaceNamespacedEvent

-- | @PUT \/apis\/events.k8s.io\/v1beta1\/namespaces\/{namespace}\/events\/{name}@
-- 
-- replace the specified Event
-- 
-- AuthMethod: 'AuthApiKeyBearerToken'
-- 
replaceNamespacedEvent 
  :: (Consumes ReplaceNamespacedEvent contentType, MimeRender contentType V1beta1Event)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Accept accept -- ^ request accept ('MimeType')
  -> Name -- ^ "name" -  name of the Event
  -> Namespace -- ^ "namespace" -  object name and auth scope, such as for teams and projects
  -> V1beta1Event -- ^ "body"
  -> KubernetesRequest ReplaceNamespacedEvent contentType V1beta1Event accept
replaceNamespacedEvent _  _ (Name name) (Namespace namespace) body =
  _mkRequest "PUT" ["/apis/events.k8s.io/v1beta1/namespaces/",toPath namespace,"/events/",toPath name]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyBearerToken)
    `setBodyParam` body

data ReplaceNamespacedEvent 
instance HasBodyParam ReplaceNamespacedEvent V1beta1Event 

-- | /Optional Param/ "pretty" - If 'true', then the output is pretty printed.
instance HasOptionalParam ReplaceNamespacedEvent Pretty where
  applyOptionalParam req (Pretty xs) =
    req `setQuery` toQuery ("pretty", Just xs)

-- | @*/*@
instance MimeType mtype => Consumes ReplaceNamespacedEvent mtype

-- | @application/json@
instance Produces ReplaceNamespacedEvent MimeJSON
-- | @application/yaml@
instance Produces ReplaceNamespacedEvent MimeYaml
-- | @application/vnd.kubernetes.protobuf@
instance Produces ReplaceNamespacedEvent MimeVndKubernetesProtobuf

