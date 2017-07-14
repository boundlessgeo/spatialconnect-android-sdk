/**
 * Copyright 2015-2017 Boundless, http://boundlessgeo.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License
 */
package com.boundlessgeo.spatialconnect.query;


import java.util.ArrayList;
import java.util.List;

public class SCQueryFilter
{
    private SCPredicate predicate;
    private List<String> mLayerIds = new ArrayList<>();
    private String featureId;

    private int limit = 100;

    public SCQueryFilter(SCPredicate scPredicate)
    {
        mLayerIds = new ArrayList<>();
        this.predicate = scPredicate;
    }

    public SCPredicate getPredicate()
    {
        return predicate;
    }

    public void addLayerId(String id) {
        mLayerIds.add(id);
    }

    public List<String> getLayerIds() {
        return mLayerIds;
    }

    public void addLayerIds(List<String> layerIds) {
        mLayerIds.addAll(layerIds);
    }

    public int getLimit() {

        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getFeatureId() {
        return this.featureId;
    }

    public void setFeatureId(String s) {
        this.featureId = s;
    }
}
