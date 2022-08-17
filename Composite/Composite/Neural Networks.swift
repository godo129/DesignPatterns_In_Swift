//
//  Neural Networks.swift
//  Composite
//
//  Created by hong on 2022/08/17.
//

import Foundation

class Neuron : Sequence
{
    var inputs = [Neuron]()
    var outputs = [Neuron]()
    
    func makeIterator() -> IndexingIterator<Array<Neuron>>
    {
        return IndexingIterator(_elements: [self])
    }
    

}

class NeuronLayer : Sequence
{
    private var neurons: [Neuron]
    
    func makeIterator() -> IndexingIterator<Array<Neuron>>
    {
        return IndexingIterator(_elements: neurons)
    }
    
    init(count: Int)
    {
        neurons = [Neuron](repeating: Neuron(), count: count)
    }
}

extension Sequence
{
    func connect<Seq: Sequence>(to other: Seq)
    where Seq.Iterator.Element == Neuron,
          Self.Iterator.Element == Neuron
    {
        for from in self
        {
            for t in other
            {
                from.outputs.append(t)
                t.inputs.append(from)
            }
        }
    }
}

//func main()
//{
//    var neuron1 = Neuron()
//    var neuron2 = Neuron()
//    var layer1 = NeuronLayer(count: 10)
//    var layer2 = NeuronLayer(count: 20)
//    
//    neuron1.connect(to: neuron2)
//    neuron1.connect(to: layer1)
//    layer1.connect(to: neuron2)
//    layer1.connect(to: layer2)
//}
